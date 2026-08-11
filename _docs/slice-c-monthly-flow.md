# G012 Slice C — Monthly Cross-Project Invoice Flow

**Owner:** invoicedaddy (planner) → hackdaddy (executor)
**Status:** flow defined, waiting on ADV-800 fixes (see handoff)
**Last updated:** 2026-08-11

## Overview

On the 1st of each month, invoicedaddy polls all billable project-meta repos for
the previous month's work, side-channels with each project's goaldaddy/taskdaddy
for confirmation, and assembles draft invoices in Notion.

## Billable projects (projects.yml allowlist)

| Project  | Tenant  | Noko ID | wrklogr Status |
|----------|---------|---------|----------------|
| brodie   | brodie  | 719747  | ✅ mapped      |
| jono     | jono    | 560046  | ✅ mapped      |
| salon94  | salon94 | 611157  | ✅ mapped      |
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
1. hackdaddy runs `wrklogr notion-invoice` per project
2. invoicedaddy reviews drafts
3. Monthly report generated for operator

### Monthly report (operator-facing)
Generated at `reports/YYYY-MM.md`:
- Per-project: hours, amount, status (draft/confirmed/sent)
- Total: aggregate hours + amount
- Pending: projects not yet confirmed

## Guards
- **No unconfirmed billing** — project agent must agree
- **Draft only** — invoicedaddy/hackdaddy never set Sent/Paid
- **Allowlist only** — projects must be in projects.yml + have Noko id
- **No double-billing** — check prior invoices before drafting

## Signals polled per project
1. `goals/*.md` — closed goals with `status: done` (when goals/ exists)
2. `continues/*.md` — committed handoffs in billing month
3. `brane_wrklogr_report` — git commit → session → hours
4. Session artifacts (herm-core API, tenant-scoped)

## Current state (Aug 2026)
- [x] work-summary.sh built (hackdaddy, build half)
- [x] wrklogr wired with Noko mappings for brodie/jono/salon94
- [ ] ADV-800 fixes (4 bugs — routed to hackdaddy via handoff)
- [ ] No goals/ directories exist in any project-meta (goaldaddy adoption pending)
- [ ] slyce/dublab/farmppl need Noko project ids + wrklogr config
