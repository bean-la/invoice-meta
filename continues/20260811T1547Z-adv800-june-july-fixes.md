---
handoff_id: 20260811T1547Z-adv800-june-july-fixes
project: invoice
repo: bean-la/invoice-meta
worktree: /home/herm/repos/github.com/bean-la/invoice-meta
status: working
owner_agent: herm-b-invoice-hackdaddy
owner_host: herm-b
supersedes: []
task_id:
lease_id:
routed_via: invoicedaddy
created_at: 2026-08-11T15:47:00Z
updated_at: 2026-08-11T16:35:00Z
closed_at:
---

# Continue — ADV-800 June+July update with 4 fixes

**Full brief:** [`brane/_inbox/flag-260811-adv800-june-july-rate-label.md`](../brane/_inbox/flag-260811-adv800-june-july-rate-label.md)
**Repo:** `bean-la/invoice-meta` · `main` @ `03592f2` · dirty=2

## Context
ADV-800 needs to be updated to June+July range. The wrklogr tool has 4 bugs that must be fixed BEFORE re-running the invoice, or the numbers will be wrong. All fixes are in `tools/wrklogr/`. Operator confirmed: draft only, $1,100/day rate, do not touch jono/salon94.

## 4 fixes required (in order)

### Fix 1: Author-merge correctness (P1 — bills client dev time to us)
**File:** `tools/wrklogr/internal/session/session.go`
- `Build()`: add `Author` to `Commit` struct, carry through, NEVER merge across authors
- Policy: bill `seb@bean.la` + herm agents only; exclude `nphillips` + `shopify[bot]`
- Verify: ADV-800 hours drop to billable-only

### Fix 2: Submodule config (all 3 brodie paths)
**File:** `wrklogr.toml` (repo root)
- Add `brodie-portal` to `[noko.projects]` with same `project_id = 719747`
- Add `brodie-portal` to `repos` list
- Verify: dry-run includes brodie-meta + shopbrodie-shopify + brodie-portal

### Fix 3: Rate label (display only — calc is correct)
**Files:** `tools/wrklogr/cmd/wrklogr/notion_invoice.go:824` + `main.go:439/449`
- Change `'%.2fh × $%.0f'` → `'Y days × $1100/day backend'`
- `grandTotalDays ÷8` display consistent labeling
- Snapshot: add `rate_is_daily: true`

### Fix 4: gcal meetings missing
**Files:** `tools/wrklogr/cmd/wrklogr/notion_invoice.go` + internal
- Add `--gcal` flag to notion-invoice
- Pull `[gcal] calendar = seb@bean.la` events in billing range
- Merge as billable sessions (pattern from `report_core.go`)
- Verify: brodie meetings appear in ADV-800

## After all fixes
1. Rebuild wrklogr: `cd tools/wrklogr && go build ./cmd/wrklogr`
2. Dry-run: `wrklogr notion-invoice --update --invoice-number ADV-800 --since 2026-06-01 --until 2026-07-31 --local-path /home/herm/repos/github.com/bean-la/brodie-meta --dry-run`
3. Verify hours + amounts correct, then write mode
4. Report to invoicedaddy

## Progress (2026-08-11, invoice-hackdaddy)
ALL 4 FIXES DONE + verified (build + tests pass, dry-run runs). Commit-based
ADV-800 dry-run = **\$11,137.50 (10.1 days × \$1100/day)** across
brodie-meta/brodie-portal/shopbrodie-shopify (author-filtered, all submodules,
correct rate label).

**BLOCKER (do not write yet):** `--gcal` raw dump over-counts badly — 127 events
from the shared seb@bean.la calendar attributed to brodie = **\$64,487.50
(58.6 days)**, clearly over-billed (calendar is shared across all clients,
includes non-billable/recurring events).

**Recommendation:** ship the commit-based draft (\$11,137.50, no gcal) as the
corrected ADV-800, OR operator curates which specific meetings to include
(builder prep, 6/23 client session, Aug 11 call) before writing. Awaiting
operator/invoicedaddy decision.

## Do not
- Touch jono/salon94 invoices
- Change $1,100/day rate VALUE
- Set status to Sent/Paid (draft only)
- Commit tokens or secrets
