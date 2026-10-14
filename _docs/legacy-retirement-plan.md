# Legacy invoicing retirement plan

**Status:** migration work in progress; no legacy service should be deleted or
shut down until the gates below are complete.

## Replacement path

`Noko → wrklogr stripe-invoice → Stripe draft → human review → Stripe finalize/send → hosted payment link`

`wrklogr stripe-invoice --rounding legacy-quarter-day` preserves the historical
Bean API calculation for clients that still use the old invoice convention:

1. Sum invoiceable minutes for the period.
2. Convert minutes to eight-hour days.
3. Round days to the nearest 0.25 day.
4. Multiply by the configured day rate.

The default `daily-cents` mode remains available when a dated Noko breakdown is
preferred.

## Verification gates

- [ ] Compare one historical Notion/PDF invoice against a Stripe draft using
  `legacy-quarter-day` and record the result.
- [x] Verify the Max current-hours calculation against the legacy Bean API:
  5.5 hours at $850/day → 0.75 day → $637.50.
- [ ] Verify category-specific rates and quarter-day rounding for a multi-role
  invoice (backend/frontend/design or equivalent).
- [ ] Verify gratis deductions, total overrides, and discount notes have an
  explicit Stripe representation or an approved exception.
- [ ] Finalize and send one approved Stripe invoice, then reconcile payment
  status and hosted URL back to the invoice record.
- [ ] Archive historical PDFs and retain the source Notion records needed for
  audit and tax purposes.

## Retirement sequence

1. Freeze new Notion invoice creation while keeping existing records read-only.
2. Keep `bean-invoicing-api`, `bean-invoicing-web`, and Heroku available for
   historical PDF retrieval during the retention window.
3. Move any required PDF attachments or stable links into the retained archive.
4. Remove new callers and scheduled jobs that depend on the Heroku renderer.
5. Rotate/remove legacy hosting credentials only after confirming no retained
   workflow needs them.
6. Put the Heroku app into a recoverable paused state or equivalent, verify
   historical access requirements, and only then consider decommissioning it.
7. Archive the old repositories rather than deleting them; preserve commit
   history and the final migration notes.

## Current known exception

The current Max draft contains the historical $4,250 ADV-786 line plus current
hours. It is still a draft and has not been finalized or sent. It should not be
used as the final cutover proof until the pricing convention is approved.
