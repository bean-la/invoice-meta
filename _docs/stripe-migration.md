# Stripe-centered invoice migration

**Status:** implementation branch published in `bean-la/wrklogr` as `codex/stripe-invoice-export`.

## Target flow

```text
Noko (billable + not invoiced)
  → wrklogr stripe-invoice (day-level or legacy-quarter-day preview)
  → human/project confirmation
  → Stripe draft
  → human review
  → Stripe finalize/send
  → Stripe hosted payment page
```

Noko remains the source of truth for time. Stripe becomes the source of truth
for customer, invoice, payment state, and hosted card/bank payment links.
Notion is no longer required to create a payable invoice.

## Current Max / The Ranch mapping

- Noko project: `606165` (`Max Levai`)
- Stripe customer: the existing Max Levai customer in the Bean.la account
- Existing Stripe draft: `$5,150`, composed of the existing `$4,250` work line and
  one added `$900` day line
- Noko’s current 2026 report shows 7 total hours and 5½ invoiceable hours; the
  new wrklogr command uses Noko’s `billable=true` and `invoiced=false` filters.

## Approval and safety rules

1. Generate a dry-run preview first. Use the dated mode for a day breakdown, or
   `--rounding legacy-quarter-day` to reproduce the Bean API convention.
2. Confirm the work period and total with the project/client owner.
3. Create a Stripe draft with `--create`; the command does not finalize or send.
4. Review Stripe line items and customer details before finalization.
5. Finalize/send from Stripe only after approval; this is when Stripe creates the
   hosted invoice URL.
6. Reconcile the Stripe invoice ID back into this repo’s monthly report. Do not
   mark Noko entries as externally invoiced until the Stripe draft has been
   approved and sent; retain the Stripe invoice ID for later reconciliation.

## Legacy path and retirement

`wrklogr notion-invoice` and the Bean-style Heroku PDF renderer remain available
for historical invoices and comparison during cutover. No new invoice should
be created in Notion once a Stripe draft has been approved for the same period.

Retire the legacy path only after:

See the full staged checklist in [legacy-retirement-plan.md](legacy-retirement-plan.md).

- historical PDFs and Notion page references are archived;
- at least one Max/Ranch invoice has been reconciled end-to-end in Stripe;
- the Stripe hosted link and PDF have been verified;
- no active workflow or automation still depends on the Heroku URL;
- Heroku and Notion credentials are removed from deployed environments.
