---
flag_id: flag-261006-invoice-gmail-access-for-september-review
project: invoice
status: open
to_lane: herm/router
owner_lane: invoicedaddy
created_at: 2026-10-06T20:02:43Z
created_by: herm-b-invoice-invoicedaddy
parent_goal: G012
priority: P2
---

# Resolve scoped Gmail access for invoicedaddy invoice review

Please route to the Herm lane that owns shared Gmail source relationships and tenant email whitelists, and advise/complete the least-privilege authorization steps.

## Need
For September 2026 invoice review, include client-directed Gmail messages authored by Nick (`nick@bean.la`) and Seb (`seb@bean.la`) alongside verified client calls from GCal. Review rule: qualifying session minimum is 0.5h; avoid double-counting duplicated messages in a thread. Do not write/push Noko entries until the operator reviews the evidence.

## Evidence of access problem
- `herm_gmail_live_search` for `after:2026/09/01 before:2026/10/01` failed HTTP 403: Gmail live search unavailable for tenant `invoice`: no active shared relationship and email whitelist.
- `herm_gmail_search` returned zero messages; scope reported `shared_source_tenant: null` and `shared_filter: null`.
- A direct `herm_mailbox_send` to `herm/router` with `tenant_slug: herm` failed HTTP 403 because agent `herm-b-invoice-invoicedaddy` lacks permission for scope `{lanes:[router], tenant:herm}`. Please route this durable flag using the canonical resolver rather than retrying direct cross-tenant mailbox delivery.

## Useful current GCal evidence
- Brodie client calls in September: Sep 1, 8, 11, 16, 22, 25, 29. Calendar attendee lists include Ryan (`ryan@h-n-m.com`), Nick, and Seb. Scheduled total 4.5h.
- Salon94 x Bean on Sep 3: 1h; invitees include Andrew and Athena at Salon94 and Seb (`seb@bean.la`).
- Total candidate client-call time: 8 events / 5.5 scheduled hours; invitees do not confirm attendance. Reported to avoid project-level double counting and require operator review.
- No matching Jono/Pando client call was found in the GCal query.
- GCal search tooling is available and returns title, scheduled start/end and attendee addresses; broad wrklogr calendar mode also includes unrelated events and should not be treated as billable without filtering.

## Requested resolution
1. Confirm the correct shared Gmail source tenant/relationship for the invoice tenant.
2. Establish or approve a narrow, synchronized email whitelist permitting search of relevant client communications for the invoiced projects, including Nick/Seb as authors and client correspondents/domains. Do not grant broad mailbox access without operator approval.
3. Confirm when access is active and how to query September messages (sender/recipient/date filters). If authorization requires operator action, specify the exact approval needed.
4. Do not include email time until messages are accessible, attributable to an author/client/project, and reviewed. No Gmail content has been accessed or added to totals yet.
