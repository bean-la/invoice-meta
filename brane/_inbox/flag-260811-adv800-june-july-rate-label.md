---
flag_id: flag-260811-adv800-june-july-rate-label
project: invoice
status: open
owner_lane: hackdaddy
created_at: 2026-08-11T15:30:00Z
created_by: herm-b-herm-taskdaddy
parent_goal: G012
priority: P1
---
# ADV-800 update: June+July range + rate-unit labeling fix (invoice worker)

Handoff: continues/20260811T0730Z-adv800-june-july-rate-label.md (goaldaddy, operator direction).

PART A — rate label fix (wrklogr source, small Go change):
- invoice-meta/tools/wrklogr/cmd/wrklogr/notion_invoice.go:824: '%.2fh × $%.0f' → days + per-day rate: 'Y days × $1100/day backend'
- main.go:439/449 (grandTotalDays ÷8 display) consistent labeling
- snapshot proposed.rate — add unit note rate_is_daily: true
- Verify: rebuild wrklogr, notion-invoice --dry-run shows 'days × $/day'

PART B — ADV-800 update to June+July:
- wrklogr notion-invoice --update --invoice-number ADV-800 --since 2026-06-01 --until 2026-07-31 --local-path /home/herm/repos/github.com/bean-la/brodie-meta --dry-run (then write mode)
- Amount = (June+July hours ÷ 8) × $1,100/day
- Description covers June+July work (combo images, builder cart, policy drawer, 404 refresh, builder gallery, launch prep)
- Cross-check June+July commits both brodie-meta + shopbrodie (snapshot only had July's 20)

CONSTRAINTS: Draft only (not Sent/Paid, operator reviews). Do NOT double-bill July (remove old July-only amount). Do NOT change rate VALUE ($1,100/day confirmed — label only). Do NOT touch jono/salon94 invoices. No tokens committed.

Report when ADV-800 updated + rate label fixed + verified.
