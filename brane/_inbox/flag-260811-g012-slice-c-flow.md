---
flag_id: flag-260811-g012-slice-c-flow
project: invoice
status: open
owner_lane: invoicedaddy
created_at: 2026-08-11T15:02:00Z
created_by: herm-b-herm-taskdaddy
parent_goal: G012
priority: P2
---
# G012 Slice C — FLOW half dispatch (invoicedaddy)

Handoff: continues/20260811T0655Z-g012-slice-c-cross-project-pull.md (in herm-meta; depends on Slice B, closed).

**OPERATOR DIRECTIVE 2026-08-14 (wind-down): Slice C runs ON DEMAND, triggered by the operator — NO automation, NO monthly cadence, NO cron/1st-of-month polling.**

Your steps (flow owner, all run only when the operator triggers an invoice pass):
1. **On trigger**: poll ALL project goal boards (brodie/jono/slyce/dublab/salon94/farmppl) via brane MCP (G008 fleet-board pattern) and assemble the per-project month's work. Do NOT poll automatically on a schedule.
2. Run `scripts/work-summary.sh --project <slug> --month <YYYY-MM>` per project (BUILD half, already done by herm-hackdaddy c8c2088).
3. Side-channel confirm: route each project's work summary to its goaldaddy/taskdaddy via G008 — "here's what I'll bill for [month], confirm or correct." Two-way loop; project must agree before invoices draft.
4. Feed confirmed summary → wrklogr notion-invoice → Notion draft.
5. Report: operator-facing summary of drafted invoices + hours + amounts.

Guards: don't bill a project whose agent didn't confirm. Drafts only, no Sent/Paid. Only projects in projects.yml routing (G008 allowlist). Don't regress ADV-800 brodie flow. Invoice pass starts ONLY on operator request.

BUILD half is with herm-hackdaddy (work-summary script + wrklogr wiring). Coordinate. Report when flow set up.
