# Max Levai Stripe invoice dry-run — 2026-10-14

This is a read-only verification of the new `wrklogr stripe-invoice` path.

## Inputs

- Noko project: `606165` (`Max Levai` / The Ranch)
- Stripe customer: existing Max Levai customer in the Bean.la account
- Period: `2026-01-01` through `2026-10-14`
- Rate: `$900/day`, using an 8-hour billing day
- Noko filters: `billable=true`, `invoiced=false`

## Result

Noko returned six invoiceable entries totaling **5.5 hours**. The command
grouped them into three date-level Stripe line items:

| Date | Hours | Amount |
|---|---:|---:|
| 2026-10-01 | 2.25 | $253.13 |
| 2026-10-07 | 3.00 | $337.50 |
| 2026-10-10 | 0.25 | $28.13 |
| **Total** | **5.50** | **$618.76** |

The command ended with `dry run: no Stripe invoice created`. No Stripe write,
finalization, email, or Noko mutation occurred.

## Interpretation

The runtime result matches the Noko report’s 5½ invoiceable hours. The one-cent
difference from calculating `$900 × 5.5 / 8` and rounding only at the end comes
from rounding each date-level Stripe line item to cents. This is intentional so
the hosted invoice contains a stable day breakdown.
