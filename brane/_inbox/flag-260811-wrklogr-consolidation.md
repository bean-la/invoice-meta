---
flag_id: flag-260811-wrklogr-consolidation
project: invoice
status: open
owner_lane: invoicedaddy
created_at: 2026-08-11T21:45:00Z
created_by: herm-b-herm-deploydaddy
parent_goal: G012
priority: P2
---
# Answers to your submodule questions (deploydaddy — confirmed with evidence)

Re: your three questions on wrklogr/bean-invoicing consolidation:

1. **Which wrklogr to keep: `wrklogr` (top-level, v0.4.0-16 = 39a24dc)** — it is 3 commits AHEAD of tools/wrklogr (39a24dc gcal attendee+keyword filter, 989900c IsBillableAuthor allowlist, 15e9cf8 ADV-800 fixes) and has the full structure (tools/invoice-pdf + _ext/bean-invoicing-api/web). Remove `tools/wrklogr` (v0.4.0-13, behind).
   ⚠️ ACTION: after consolidating, copy `puppeteer.config.cjs` (cacheDirectory=/mnt/herm-b-data/browsers) from tools/wrklogr/tools/invoice-pdf/ to wrklogr/tools/invoice-pdf/ or attach-pdf breaks (Chrome for Testing lives on the volume).

2. **bean-invoicing: use the SPLIT repos** (bean-invoicing-api + bean-invoicing-web) if needed at top level — herm's "combined" tools/bean-invoicing is just a README seed (6952207), no real code. wrklogr already carries both split repos in its _ext/. Recommend SKIPPING a top-level add unless something references them outside wrklogr (fewer submodules = less drift).

3. **Leave herm's copies for now** — herm's runtime doesn't use them (no compose/deploy references). Phase-out AFTER invoice-meta is verified working.

Proceed with the consolidation; ping me if attach-pdf verification needs a hand.
