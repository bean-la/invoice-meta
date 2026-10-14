# G012 Slice C — Monthly Cross-Project Invoice Flow

**Owner:** invoicedaddy (planner) → hackdaddy (executor)
**Status:** flow defined, waiting on ADV-800 fixes (see handoff)
**Last updated:** 2026-10-14

## Overview

On the 1st of each month, invoicedaddy polls all billable project-meta repos for
the previous month's work, side-channels with each project's goaldaddy/taskdaddy
for confirmation, and assembles Stripe draft invoices. Notion remains a
historical compatibility path only.

## Billable projects (projects.yml allowlist)

| Project  | Tenant  | Noko ID | wrklogr Status |
|----------|---------|---------|----------------|
| brodie   | brodie  | 719747  | ✅ mapped      |
| jono     | jono    | 560046  | ✅ mapped      |
| salon94  | salon94 | 611157  | ✅ mapped      |
| maxlevai | maxlevai | 606165  | ✅ mapped      |
| slyce    | slyce   | —       | ❌ no Noko id  |
| dublab   | dublab  | —       | ❌ no Noko id  |
| farmppl  | farmppl | —       | ❌ no Noko id  |

Only projects with Noko mappings can be invoiced (G012 guard).

## Monthly cadence

### 1st of month — Poll
```bash
# invoicedaddy runs:
for project in brodie jono salon94 slyce dublab farmppl; do
  # Pull work data via wrklogr report (MCP)
  # OR use scripts/work-summary.sh for structured output
  scripts/work-summary.sh --project "$project" --month "$(date -d 'last month' +%Y-%m)"
done
```

### Side-channel confirmation
For each project with hours > 0:
1. Route work summary to project's goaldaddy via brane flag or handoff
2. Template: "Here's what I'll bill for [month]: [summary]. Confirm or correct."
3. Project must agree before invoice draft
4. Record confirmation in invoice-meta tracking

### Invoice assembly
After all confirmations:
1. hackdaddy runs `wrklogr stripe-invoice` per project for a dry-run preview
2. invoicedaddy reviews day-level totals, customer, period, and rate
3. hackdaddy reruns with `--create` to create a Stripe draft only
4. an authorized operator reviews and finalizes/sends the draft in Stripe;
   Stripe then provides the hosted payment URL
5. the monthly report records the Stripe invoice ID and hosted-link state

For historical invoices or PDF comparison, use the legacy `notion-invoice`
commands. Do not create both a Notion invoice and a Stripe invoice for the
same period.

### Monthly report (operator-facing)
Generated at `reports/YYYY-MM.md`:
- Per-project: hours, amount, status (draft/confirmed/sent)
- Total: aggregate hours + amount
- Pending: projects not yet confirmed

## Guards
- **No unconfirmed billing** — project agent must agree
- **Draft only** — wrklogr never finalizes or sends Stripe invoices
- **Allowlist only** — projects must be in projects.yml + have Noko id
- **No double-billing** — check prior invoices before drafting

## Signals polled per project
1. `goals/*.md` — closed goals with `status: done` (when goals/ exists)
2. `continues/*.md` — committed handoffs in billing month
3. `brane_wrklogr_report` — git commit → session → hours
4. Session artifacts (herm-core API, tenant-scoped)

## Current state (Oct 2026)
- [x] work-summary.sh built (hackdaddy, build half)
- [x] wrklogr wired with Noko mappings for brodie/jono/salon94/maxlevai
- [x] Stripe draft path and hosted-link approval flow documented
- [ ] ADV-800 fixes (4 bugs — routed to hackdaddy via handoff)
- [ ] No goals/ directories exist in any project-meta (goaldaddy adoption pending)
- [ ] slyce/dublab/farmppl need Noko project ids + wrklogr config
