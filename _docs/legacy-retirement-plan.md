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
  `legacy-quarter-day` and record the result. The read-only historical audit
  currently matches ADV-786 exactly, but no new live Stripe draft was created
  solely for this audit.
- [x] Verify the Max current-hours calculation against the legacy Bean API:
  5.5 hours at $850/day → 0.75 day → $637.50, with the renderer-compatible
  $0.50 adjustment producing a $638.00 customer total.
- [x] Verify category-specific rates and quarter-day rounding for a multi-role
  fixture (backend/design): 0.75 day at $850 plus 0.25 day at $1,000 produces
  $887.50 in the API calculation and $888 in the legacy renderer; wrklogr
  reproduces the rendered total with an explicit adjustment.
- [x] Verify gratis deductions, total overrides, and discount notes have an
  explicit Stripe representation or an approved exception. The wrklogr path
  supports explicit `--gratis-days category=days`, `--total-override`, and
  `--discount-note` adjustments on legacy-quarter-day drafts; a real historical
  invoice still needs human review before cutover.
- [ ] Finalize and send one approved Stripe invoice, then reconcile payment
  status and hosted URL back to the invoice record. wrklogr now provides the
  read-only `stripe-invoice-status --invoice-id` command for this step.
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

## Current Heroku caller inventory

As of the migration branch audit, the remaining `bean-invoicing.herokuapp.com`
references are confined to the legacy Notion/PDF path:

- `cmd/wrklogr/notion_invoice_pdf.go` default URL and help text;
- `tools/invoice-pdf/print.mjs` default renderer URL;
- `docs/notion-invoicing.md` legacy setup instructions; and
- tests that assert the legacy URL construction.

The Stripe invoice command and its documentation do not call Heroku. These
legacy callers should be removed or made explicitly opt-in only at the
cutover checkpoint, after the historical PDF archive and Stripe payment
reconciliation gates are complete. Until then, keep the old defaults and
hosting recoverable.

For client migrations that depended on the old untagged roster behavior,
wrklogr now exposes `stripe.legacy.user_mapping = "bean"` as an explicit
compatibility setting. New configurations should omit it and use logical
roster mapping.

## Current known exception

The current Max draft contains the historical $4,250 ADV-786 line plus current
hours. It is still a draft and has not been finalized or sent. It should not be
used as the final cutover proof until the pricing convention is approved.

## Latest verification note

On 2026-10-14, the live Noko query for project `606165` returned six current,
billable, not-yet-invoiced entries from Nick totaling 5.5 hours. The
legacy-quarter-day dry-run classified the untagged entries as backend and
calculated 0.75 day at $850/day, or $637.50. The legacy Vue renderer then
applies `Math.round(subTotal)`, so the Stripe-compatible customer total is
$638.00 with an explicit $0.50 rounding adjustment. No Stripe invoice was
created by that verification run. The existing live drafts remain untouched.

A local mixed-role fixture was also executed through the pinned legacy
`noko.ts` utility and `BeanInvoice.vue`: 0.75 backend day at $850 plus 0.25
design day at $1,000 produced $887.50 in the API calculation and `$888` in the
rendered invoice. wrklogr now reproduces that rendered total with a separate
legacy rounding line.

The historical `--include-invoiced` wrklogr audit for ADV-786 returned 24
billable entries totaling 2,010 minutes (33.5 hours). Its legacy preview was
4.25 days at $1,000/day for $4,250.00, matching the retained three-page PDF's
single backend line and the Notion Amount property. The flag cannot be used
with `--create`.

A broader five-invoice sample (ADV-815, ADV-816, ADV-817, ADV-814, and
ADV-809) also reproduced the stored totals; see
[`recent-invoice-cross-check-2026-10-14.md`](recent-invoice-cross-check-2026-10-14.md).
Three matched directly from hours/rates and quarter-day rounding, while two
required their explicit Notion `Total Override` values.
