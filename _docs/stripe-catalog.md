# Stripe service catalog

The live `bean.la` Stripe account has a reusable service catalog for the
replacement invoicing flow. These are one-time USD Prices, not subscriptions.

| Object | ID | Amount | Role |
| --- | --- | ---: | --- |
| Product | `prod_VRMoq79J75Vzkl` | — | Bean Professional Services — Billable Day |
| Price | `price_0UQU5D4gM0bOtPO0zzNTV5zp` | $850/day | Current default |
| Price | `price_0UQU5K4gM0bOtPO0W29F9yqz` | $900/day | Alternate rate |
| Price | `price_0UQU5N4gM0bOtPO0QjUxjUXv` | $1,000/day | Historical ADV-786 rate |

Lookup keys are, respectively:

- `bean_professional_services_day_850_usd`
- `bean_professional_services_day_900_usd`
- `bean_professional_services_day_1000_usd`

## Usage rule

The catalog establishes the approved day-rate references. `wrklogr` should
continue creating invoice-specific line amounts from Noko rather than using a
Price quantity as the source of truth. That preserves the Bean behavior for
quarter-day rounding, category-specific rates, gratis deductions, whole-dollar
renderer rounding, and total overrides. Each generated line carries its rate,
category, raw minutes, rounded days, and Noko entry IDs in metadata.

Do not create recurring Prices for this workflow. Do not change or deactivate
these Prices without a rate-approval decision; Stripe Prices are immutable for
amount changes, so a new approved rate should receive a new Price and lookup
key.
