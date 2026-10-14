# Max Levai Stripe invoice dry-run — 2026-10-14

This is a read-only verification of the new `wrklogr stripe-invoice` path.

## Inputs

- Noko project: `606165` (`Max Levai` / The Ranch)
- Stripe customer: existing Max Levai customer in the Bean.la account
- Period: `2026-01-01` through `2026-10-14`
- Rate: `$850/day`, using an 8-hour billing day
- Noko filters: `billable=true`, `invoiced=false`

## Result

Noko returned six invoiceable entries totaling **5.5 hours**. The command
grouped them into three date-level Stripe line items:

| Date | Hours | Amount |
|---|---:|---:|
| 2026-10-01 | 2.25 | $239.06 |
| 2026-10-07 | 3.00 | $318.75 |
| 2026-10-10 | 0.25 | $26.56 |
| **Total** | **5.50** | **$584.37** |

The command ended with `dry run: no Stripe invoice created`. No Stripe write,
finalization, email, or Noko mutation occurred.

## Interpretation

The runtime result matches the Noko report’s 5½ invoiceable hours. The
date-level lines use daily-cents rounding, so they intentionally differ from
the legacy Bean quarter-day result of $638.00 ($637.50 plus the renderer's
$0.50 whole-dollar adjustment).

The live Stripe draft `A5C63363-0057` currently contains the historical
ADV-786 line for $4,250.00 plus these three daily-cents lines, for a draft
subtotal of $4,834.37. It is still a draft, has no hosted payment URL, and was
not changed during this audit. A legacy-compatible combined total would be
$4,888.00, so this draft is not yet the cutover proof.

A separate live review draft, `A5C63363-0058`, was then created without
finalization or sending. Its read-back total is exactly $4,888.00:

- ADV-786 historical work: $4,250.00
- Current Noko work: $637.50 (0.75 day at $850/day)
- Legacy whole-dollar adjustment: $0.50

It is marked `review_only` / `do_not_send` in metadata and has no hosted
payment URL. Drafts `0056` and `0057` were not modified.
