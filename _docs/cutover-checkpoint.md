# Stripe invoicing cutover checkpoint

**Checkpoint state:** ready for human approval; not yet authorized for send or
legacy shutdown.

## Evidence complete

- Legacy Bean API and Vue renderer behavior is reproduced in wrklogr:
  category aggregation, quarter-day rounding, day rates, gratis/discount and
  total-override adjustments, roster compatibility, and final whole-dollar
  rounding.
- ADV-786 and five recent Notion invoices cross-check to Noko and the legacy
  PDFs with no unexplained total differences.
- Live Stripe draft `A5C63363-0058` reads back at `$4,888.00` with the
  legacy-compatible three-line breakdown. It remains `draft`, `auto_advance`
  is false, and it has no hosted URL.
- Existing drafts `A5C63363-0056` and `A5C63363-0057` remain untouched.
- Netlify site `bean-invoice-renderer` is provisioned in the Bean team, with a
  pushed renderer migration branch and non-secret legacy API bridge variables.
  It is not yet a cutover: the PDF/Puppeteer API remains on Heroku.

## Human approval gates

- [ ] Confirm the recipient, billing period, rate convention, and `$4,888.00`
  total for the review draft.
- [ ] Finalize and send `A5C63363-0058` from Stripe.
- [ ] Verify the resulting hosted payment URL and customer-facing PDF.
- [ ] Reconcile the Stripe invoice ID, status, amount paid, and paid timestamp
  back to the retained invoice record after payment.
- [ ] Confirm the historical PDF archive and Notion source records are
  accessible under the retention policy.
- [ ] Deploy the Netlify renderer branch and verify invoice/entries routes,
  API proxying, and a representative PDF through the replacement endpoint.
- [ ] Only after the preceding gates: freeze new Notion invoice creation,
  remove active Heroku callers, and place the legacy services into a
  recoverable paused state. Do not delete repositories or revoke credentials
  as part of this checkpoint.

The review draft is intentionally not a payment link yet. Stripe only creates
the hosted URL after finalization.

