# Recent invoice cross-check

On 2026-10-14, five recent Notion invoices were compared with the source Noko
entries and a read-only `wrklogr stripe-invoice --include-invoiced` preview.
No Stripe invoice was created or changed.

| Invoice | Client | Period | Noko billable time | Legacy rate / result | Notion/PDF total | Difference |
| --- | --- | --- | ---: | ---: | ---: | ---: |
| ADV-815 | Jono Pandolfi | 2026-09-01–09-30 | 52.00h | 6.50d × $900 | $5,850.00 | $0.00 |
| ADV-816 | Salon 94 | 2026-08-01–09-30 | 41.00h | 5.25d × $900 | $4,725.00 | $0.00 |
| ADV-814 | H-N-M (Brodie Pet) | 2026-08-01–09-30 | 98.00h | 12.25d × $1,000 | $12,250.00 | $0.00 |
| ADV-817 | Three Wishes | 2026-07-14–09-30 | 48.25h | override to $5,709.38 | $5,709.38 | $0.00 |
| ADV-809 | Three Wishes | 2026-06-10–07-10 | 22.50h | override to $1,250.00 | $1,250.00 | $0.00 |

## Findings

- ADV-815 and ADV-814 reproduce directly from raw hours, client rate, and
  legacy quarter-day rounding. Their PDFs show the same single backend line.
- ADV-816 demonstrates the rounding rule: 41 hours is 5.125 days, which
  rounds to 5.25 days at $900, not $4,612.50.
- ADV-817 and ADV-809 both depend on explicit Notion `Total Override` values.
  Their PDFs contain no priced day line, so the override—not an inferred
  default rate—is the authoritative total. The wrklogr previews reproduce the
  totals by adding a visible adjustment line.
- The sampled Notion records had no non-empty discount note, no gratis-day
  fields, and `Resource Scaling` set to `__NO__`.
- Historical comparisons must use `--include-invoiced`. The normal invoice
  command correctly excludes entries already marked invoiced, but would
  under-count these historical samples.

## Migration implication

The simple pricing profile is sufficient for ordinary invoices, provided the
client rate is selected explicitly. The replacement must retain a first-class
invoice override for negotiated totals; treating every Notion amount as
`hours × default rate` would fail on cases like ADV-817 and ADV-809.

