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

## ADDENDUM (goaldaddy pre-run findings — 2026-08-11)

ADV-800 dry-run undercounts — config fix needed, not just re-run:
- Dry-runs Jun1-Jul31: brodie-meta only 63h/$8,662.50; +shopbrodie 73h/$10,037.50; +brodie-portal 61.5h/$8,456.25 (portal NOT in repos + hours DROPPED = session-merge quirk)
- Commits Jun-Jul: brodie-meta 77, shopbrodie 111, brodie-portal 52 (~240 total) but only 61-73h attributed — session_gap=4h + min_session_hours=3 undercount dense early-June shopbrodie work

FIX (operator confirmed ALL submodules should bill):
1. wrklogr.toml repos: include all 3 paths (brodie-meta, shopbrodie-shopify, brodie-portal) OR notion-invoice local-path resolution should recurse submodules
2. Investigate why adding brodie-portal DROPS hours (session merge bug — interleaving shouldn't reduce attributed time)
3. Check June early-month (Jun 1-5, 28 shopbrodie commits) captured — 11h June count looks low

## P1 ADDENDUM (author-merge correctness bug — 2026-08-11, operator catch)

wrklogr session merge is by time-gap ONLY (no Author field, no author boundary): two people's commits within 4h = one session. Bills client's dev time to us.

Confirmed brodie Jun-Jul authors: seb@bean.la (50) + herm agents (28) = BILLABLE; nphillips (28) = CLIENT's dev — should NOT be billed; shopify[bot] (5) = exclude.

FIX (before ADV-800):
1. internal/session/session.go Build(): add Author to Commit struct, carry through, NEVER merge across authors
2. Author policy: bill seb + herm agents only; exclude nphillips + shopify[bot]
3. Verify ADV-800 hours after the fix

## P1 ADDENDUM (gcal meetings missing — 2026-08-11)

notion-invoice has NO gcal flag (verified flags: author/repo/token/update/since/until/invoice-number/local-path/dry-run/notion-token/attach-pdf/description-only). gcal merge only in report_core.go (report path). So ADV-800 + all prior invoices = ZERO meeting time.

Brodie Jun-Jul billable calls missing: builder prep (Nick/Ryan), 6/23 client session, Aug 11 call.

FIX (before ADV-800):
1. Add gcal to notion-invoice — pull [gcal] calendar = seb@bean.la events in billing range
2. Merge as billable sessions (report_core.go pattern: event → session, fuzzy hours)
3. Verify brodie meetings appear in ADV-800
