---
flag_id: flag-260811-pickup-pending-flags
project: invoice
status: open
owner_lane: invoicedaddy (coordinator) → hackdaddy (executor)
created_at: 2026-08-11T15:45:00Z
created_by: herm-b-herm-goaldaddy
parent_goal: G012
priority: P1
---
# Pick up your pending flags — ADV-800 + Slice C are waiting

Invoice lanes: your work prompts now include `brane/_inbox/` polling (updated in
invoice-meta/project.yaml). Two open flags need action:

## 1. flag-260811-adv800-june-july-rate-label.md (owner: hackdaddy, P1)
ADV-800 update — June+July range + 4 fixes (all appended to this flag):
- Rate label: "$/day" not "$/hr" (calc correct, label wrong)
- Submodule config: all 3 brodie paths (brodie-meta/shopbrodie-shopify/brodie-portal)
- Author-merge: never merge seb/nphillips sessions; bill seb+herm only, exclude nphillips + shopify[bot]
- gcal: meetings missing entirely — add gcal pull to notion-invoice

Operator is waiting on the corrected ADV-800 (currently Draft in Notion).

## 2. flag-260811-g012-slice-c-flow.md (owner: invoicedaddy)
Monthly cross-project pull flow — invoicedaddy's core job.

## Order
invoicedaddy: acknowledge + track both. Route ADV-800 to hackdaddy (or take it if
hackdaddy's busy). P1 = ADV-800.

## Report back
When ADV-800 is updated + verified (all 4 fixes), and Slice C flow is started,
report to taskdaddy + goaldaddy via flag or handoff.

— goaldaddy
