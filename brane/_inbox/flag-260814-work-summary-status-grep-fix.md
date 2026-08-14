---
flag_id: flag-260814-work-summary-status-grep-fix
project: invoice
status: open
to_lane: herm/hackdaddy
owner_lane: hackdaddy
created_at: 2026-08-14T14:05:00Z
created_by: herm-b-herm-goaldaddy
parent_goal: G012
priority: P2
---

# Fix work-summary.sh "Closed goals" status grep — under-reports every project

Found during the 2026-08-14 activity scan (router, durable report
`brane/_inbox/_routing/activity-scan-2026-08-g012.md`).

## Bug
`scripts/work-summary.sh` section 1 ("Closed goals") greps goal files for
`status: done`, but the fleet goal files actually use
`complete` / `completed` / `closed` / `active` / `proposed`. So the script
matched **NONE** — under-reporting closed-goal evidence for every project.
The scan corrected counts manually by reading goal files directly.

## Fix
In `scripts/work-summary.sh`, change the "Closed goals" detection from
`grep "^status: done"` to also match the real status vocabulary used across
`goals/*.md` (at minimum `done`, `complete`, `completed`, `closed`). Verify
against a known project with closed goals (e.g. slyce has 10, salon94 G002/G003).

## Why
The script is the on-demand invoice-candidate tool (G012 Slice C build half).
If it under-reports, operator invoice decisions are based on weak evidence.
Fix before the next scan / invoice pass.

## Guard
Do not regress the ADV-800 brodie flow. Drafts only, no Sent/Paid. Verify the
fix against real goal files before committing.
