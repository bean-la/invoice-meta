---
id: flag-260818-invoice-meta-to-bean-meta-rename
created: 2026-08-18T19:05:00Z
created_by: herm-router
status: open
priority: P3
to_lane: invoice/metadaddy
---

# NOTE: consider renaming invoice-meta → bean-meta (bean internal catchall)

## Idea (operator, 2026-08-18 — future work, non-blocking)

`invoice-meta` currently hosts the G012 cross-project invoice assembly (invoicedaddy lane).
The operator suggested it could become **`bean-meta`** — a catchall repo for **bean internal work**
beyond invoicing (cross-project admin, internal ops, fleet coordination artifacts that aren't
herm-platform or client-scoped).

This is a **note for future work**, not a current task. No action now.

## If pursued later
- Rename repo `bean-la/invoice-meta` → `bean-la/bean-meta` (GitHub rename).
- Update: `brane/projects.yml` (tenant `invoice` → `bean`), `.gitmodules` pins, lane config
  (invoicedaddy), tenant schema (`app_invoice` → `app_bean`), and any doc references.
- The G012 invoice work stays; it just gains a broader sibling scope.
- Renaming a tenant schema (`app_invoice.hrm_*` → `app_bean`) is a data migration.

## Resolution verification
- [ ] (future) operator decides whether to pursue; this flag can stay open as a parked note or be closed.
