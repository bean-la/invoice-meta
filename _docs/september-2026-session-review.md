# September 2026 work sessions — review draft

**Scope:** all commit authors; 2026-09-01 through 2026-09-30 inclusive. wrklogr queried the four repositories in `wrklogr.toml`. Commit data was fetched using GitHub/API mode (`--local=false`); calendar output used `--gcal`. This is a review artifact, not an approved invoice or Noko submission.

## Project rollup (commit-supported only)

| Project | Commits | wrklogr sessions* | Estimated hours | Session/work type evident in commit subjects |
|---|---:|---:|---:|---|
| Brodie-meta | 168 | 40 | 61h | Coordination/goals/handoffs; Shopify/theme delivery and QA; tooling, Linear and operations |
| Brodie (`bean-la/brodie`) | 75 | 14 | 36h | Portal/product implementation and review; content/policy decisions; design/theme work |
| Jono-meta | 9 | 7 | 7h | Coordination/inbox, Linear mapping, configuration/platform pin |
| Salon94-meta | 8 | 5 | 6h | Coordination/inbox, Linear mapping, shared configuration |
| **Per-repo sum** | **260** | **66** | **110h** | |

\*Per-repo counts/hours are standalone wrklogr runs. Sessions containing commits from multiple repositories are counted once in each applicable per-repo report. The combined multi-repository run clustered them together and reported **106h**, so do not add per-repo figures as deduplicated fleet time. Per-repo estimates are clustering estimates from commit timestamps, not verified timesheets. Commit author names are not displayed in this output; all authors are included.

## Session evidence / attribution

| Project | Session type | Commit evidence | Calendar / attendee attribute |
|---|---|---|---|
| Brodie-meta | Coordination, goal tracking, handoffs, project docs | Goal/continue reconciliation, QA artifacts, handoffs, Linear tooling | GCal output provides no attendee names or attendee-to-project mapping |
| Brodie-meta | Shopify/theme implementation & QA | Theme pins and updates, catalog/media, product pages, Shopify Admin and QA evidence | Not exposed |
| Brodie-meta | Tooling/operations | Linear export/mapping, Cursor preflight, config/deploy and lane state | Not exposed |
| Brodie | Portal/product implementation & review | Portal inventory, theme/design decisions, policy/content, product detail and handoffs | Brodie-titled events listed below; attendee names not exposed |
| Jono-meta | Coordination/configuration | Inbox routing, Linear project mapping, configuration and Pando pin | Not exposed |
| Salon94-meta | Coordination/configuration | Inbox routing, Linear project mapping, shared config changes | Not exposed |

## GCal review status

wrklogr reported **48 calendar events**; its GCal-inclusive combined report totaled **189h**. It surfaced apparently relevant candidates (e.g. “Brodie / Bean — Tues Standup”, “Brodie / Bean — Bi-weekly Review”, “Wally x Bean”) and personal/unrelated-looking entries, plus an apparent 24-hour event. The report output does not expose event attendee lists or start/end details, so calendar time is **not counted as valid project time** here. Validate event identity, attendees, actual duration, and project attribution before including any calendar session. The raw wrklogr GCal-linked session output is included below for review; it is not a complete event dump of all 48 events.

## Review checklist

- Confirm which commit sessions represent billable work (commit timestamps only estimate elapsed work).
- Split/attribute cross-repository sessions without double counting.
- Validate project ownership for shared meta-repo work, especially config/coordination changes.
- Match relevant GCal events to attendees and projects; reject unrelated/personal entries and validate durations.
- Approve adjusted hours before any Noko push. No Noko write was performed for this report.

## Appendix A — detailed commit sessions

wrklogr combined all-author output, preserving each dated session, estimated duration, repository attribution, commit short SHA and subject. Truncated subjects reflect wrklogr display formatting.

<details><summary>Expand detailed commits by date and session (260 commits)</summary>

```text
bean-la/brodie-meta: 168 commits
bean-la/jono-meta: 9 commits
bean-la/salon94-meta: 8 commits
bean-la/brodie: 75 commits
total: 260 commits
2026-09-02: 10h (3 sessions)
  session 1: 5h [bean-la/brodie-meta]
    commit 1: b08062ef docs(brodie): archive launch QA and coordination artifacts
    commit 2: 4cb16dc9 docs(brodie): reconcile Ryan roadmap update
    commit 3: 3e88452b docs(brodie): add launch dependency workback
    commit 4: 21aaedd1 docs(brodie): reconcile continues and goal statuses
    commit 5: d5eafc37 feat: add project-scoped read-only Linear export
    commit 6: 80dda4da feat: publish structured Linear read wrapper
    commit 7: ead462f1 chore: align G003 and G004 coordination state
    commit 8: 18a8c450 docs: route full design theme walkthrough
    commit 9: 12c2d977 docs: record walkthrough reroute
    commit 10: c16f9607 docs: note walkthrough checkout lag
    commit 11: eb9497e1 docs: record fresh design theme walkthrough
  session 2: 1h [bean-la/brodie-meta]
    commit 1: a3533d9c docs: add G001 G004 design theme gap matrix
  session 3: 4h [bean-la/brodie-meta]
    commit 1: 42bc79ae docs: record design theme gap matrix
    commit 2: 5561c271 docs: track gap matrix sharing blocker
    commit 3: 3df8e2f6 docs: record safe theme slice paths
    commit 4: 1a014c78 docs: record search slice production verification
    commit 5: 0d182fc1 docs: park visual parity pending concrete delta
    commit 6: 1a4183e6 docs: chunk Linear work into routable handoffs
    commit 7: 09c8c423 docs: record Linear comment delivery
    commit 8: bef9497e coord: request sidecar v4 Brodie triage cockpit
    commit 9: 49db0af7 docs: establish sebluair communication handoff
    commit 10: 9772a2a5 docs: reconcile goal board statuses
    commit 11: cd86289f docs: publish walkthrough evidence and submodule pin
    commit 12: d92b722b _inbox: cross-project inbound from herm (taskdaddy)
2026-09-04: 16h (11 sessions)
  session 1: 3h [bean-la/brodie-meta]
    commit 1: 829686c8 chore(qa): clean Playwright recordings before commits
    commit 2: e6d64f35 docs: handoff BRO-21 homepage demo continue
    commit 3: 5e2a2fd2 docs: note local-only Builder CDN commit in handoff
    commit 4: 077a5c07 chore: bump shopbrodie-shopify pin to 866ca58
    commit 5: c50ca089 chore: bump shopbrodie-shopify pin to 28ee2dd
    commit 6: ca7ea6de chore: handoffs for BRO-21 hero strip + spine; bump theme pi...
    commit 7: 9ce50030 chore: drop superseded continue from active continues/
    commit 8: 1ee97ee0 chore: bump shopbrodie-shopify pin for BRO-21 strip hero
    commit 9: 07cd0f20 docs(qa): BRO-21 PLP→PDP→cart spine evidence on Theme De...
    commit 10: 688c1389 chore: resolve BRO-21 hero + spine continues after ship
  session 2: 1h [bean-la/brodie-meta]
    commit 1: a70b2003 docs: add hackdaddy lane state
  session 3: 1h [bean-la/brodie-meta]
    commit 1: ce6343a4 chore: handoff restore SHOPIFY_ADMIN_token on herm-b
  session 4: 1h [bean-la/brodie-meta]
    commit 1: 95367330 docs: close Shopify admin token handoff
  session 5: 2h [bean-la/brodie-meta]
    commit 1: 64872b98 chore: reopen Shopify admin token handoff after false close
    commit 2: 27c903a4 docs: post-demo handoffs + reactivate G001 next actions
    commit 3: be23265f docs: record Admin PLP title renames for BRO-21 merch
    commit 4: 82110ef1 docs: record packshot + Theme Editor hero merch progress
    commit 5: 23ef0c9b docs: note packshot + hero picker progress on G001
    commit 6: ab82b7f5 docs: PLP media uniqueness verified after residual reassignm...
    commit 7: 91825e53 docs: mark post-demo continue blocked on operator gates
    commit 8: 74b67936 chore: pin theme 8a3d69d and close BRO-21 post-demo continue
    commit 9: 07713bf0 docs: add BRO-21 polish QA screenshots
    commit 10: 75836ed2 docs: raise G004 S04 consolidated Ryan Batch A ask
    commit 11: 2f6dfdd9 docs: correct board truth for S04 soft-retract and G001 acti...
    commit 12: 1bf9f050 chore: pin theme nav fix and record closeout
    commit 13: 68a5caca docs: record Batch A/B ungate and pin theme batch-a builds
    commit 14: 43f2df92 docs: continue for returns flow Page Admin create
    commit 15: ac6ab7c0 docs: next-session prompt for live theme walkthrough
  session 6: 1h [bean-la/brodie-meta]
    commit 1: 6ee950c3 docs: commit live theme QA artifacts
  session 7: 1h [bean-la/brodie-meta]
    commit 1: 1cf2e670 docs: record live theme walkthrough PASS and close continues
  session 8: 1h [bean-la/brodie-meta]
    commit 1: 0346cec6 docs: refresh returns start QA evidence
  session 9: 1h [bean-la/brodie-meta]
    commit 1: 66a652d1 docs: hygiene closeout — Batch A continues + Linear In Rev...
    commit 2: fca1b8ed chore(theme): pin shopbrodie-shopify to Batch B scaffolds
    commit 3: bfcefa74 docs: note Batch B Admin smoke FAIL/PASS for new pages
    commit 4: 51eafaff docs: close Batch B Page Admin continue after herm-b create
  session 10: 1h [bean-la/brodie-meta]
    commit 1: c8aee2f7 Merge branch 'main' of github.com:bean-la/brodie-meta
    commit 2: 1b99f826 docs: refresh taskdaddy state after QA sync
  session 11: 3h [bean-la/brodie-meta]
    commit 1: 44e74ebf chore: retire root playwright-audit dump; keep theme-dev-che...
    commit 2: fffabee3 chore(theme): pin shopbrodie-shopify after audit cleanup
    commit 3: 26b83733 docs: tip 5b7fc55 + Batch B In Review hygiene
    commit 4: e264a94e chore(theme): pin shopbrodie-shopify after Batch B content d...
    commit 5: 47ca6e06 docs: handoff Batch B content depth smoke
    commit 6: 243b6e6c chore(theme): pin shopbrodie-shopify after BRO-22 Builder lo...
    commit 7: a55192ed docs: tip 59c2d94 after Batch B depth + BRO-22 SSR
    commit 8: 26a0d2cc docs: handoff BRO-26 catalog; close Batch A/B + BRO-22 in WI...
    commit 9: 1e85518b docs: close BRO-26 catalog — matrix, sample inventory, con...
    commit 10: 43fae62e docs: handoff catalog Admin follow-up for herm-b token picku...
    commit 11: 00f2aa6a chore(theme): pin shopbrodie-shopify after reusable Fit & Si...
    commit 12: ae698eba docs: closeout Fit & Size + catalog follow-up handoffs
    commit 13: ff957564 docs: sync WIP after Linear board closeout
    commit 14: 262a8802 docs: note #brodie-shared Ryan ask posted
2026-09-05: 1h (1 sessions)
  session 1: 1h [bean-la/brodie-meta]
    commit 1: 9bc7442f chore: require complete handoff reports
2026-09-08: 4h (3 sessions)
  session 1: 1h [bean-la/brodie-meta]
    commit 1: 93cc56d5 docs: reconcile G004 catalog follow-up and close G005
    commit 2: 8c660cae docs: decompose catalog integrity goal into routed slices
    commit 3: 397375db docs: record G004 catalog gate status
    commit 4: 33047c4d docs: record G004 operator follow-up
  session 2: 2h [bean-la/brodie]
    commit 1: aa7efe4f Portal: make the client view a briefing, and stop it driftin...
    commit 2: dca1a994 Portal: split the sitemap's internal notes onto /cheat-sheet
    commit 3: 0c30a3e5 Portal: fold in the 9/8 client call — two architecture que...
  session 3: 1h [bean-la/brodie]
    commit 1: d07a7d7e Portal: walk every live page, and put the page list in front...
2026-09-09: 2h (2 sessions)
  session 1: 1h [bean-la/brodie]
    commit 1: 9f288fce Portal: stop naming Loop as the returns provider
    commit 2: 789a8247 Portal: add the content-block pass and the contact-detail fi...
    commit 3: 0f7e8e8d Portal: restructure the page cleanup into rounds grouped by ...
    commit 4: 9bb1d702 Portal: settle the footer spec — the design has no social ...
  session 2: 1h [bean-la/brodie]
    commit 1: b5cbe51b Portal: the contextual-content contract, and a section-first...
    commit 2: a601dc56 Portal: the component inventory, at a stable address per row
2026-09-10: 7h (4 sessions)
  session 1: 4h [bean-la/brodie]
    commit 1: fbc1400c Portal: make the inventory a review brief per component, wit...
    commit 2: 4d5e67d0 Portal: make the component page a review view first, brief s...
    commit 3: 82e9f56e Portal: stop offering a stale theme as the review target
    commit 4: a1204baa Portal: correct the "settings_data.json is ungoverned" claim
    commit 5: 7c88bfc8 Portal: reconcile the footer copy map against the post-rebui...
    commit 6: 539fe6ca Portal: separate the preview blocker from the menu-binding o...
    commit 7: 302bb186 Portal: record the two wording decisions, and stop summarisi...
    commit 8: 36994999 Portal: review in bounded passes, not one component to compl...
    commit 9: c8df7841 Portal: run the survey queue, and reconcile the submit butto...
    commit 10: 1038490a Portal: record the footer verification, and stop a locale ke...
    commit 11: 80292949 Portal: correct the live-page framing, and write down the de...
    commit 12: 95bca388 Portal: adopt Nick's five-line handoff shape
    commit 13: afcc4e90 Portal: correct the policy handoff against what actually ren...
    commit 14: e11f6981 Portal: the policy layout is what renders, not what is appro...
    commit 15: 6b239312 Portal: point the next session at the review method and the ...
  session 2: 1h [bean-la/brodie-meta]
    commit 1: 9baa91ea _inbox: cross-project inbound from herm (goaldaddy)
  session 3: 1h [bean-la/jono-meta]
    commit 1: 4197db3b _inbox: cross-project inbound from herm (goaldaddy)
  session 4: 1h [bean-la/brodie-meta, bean-la/salon94-meta]
    commit 1: 3b6d438f _inbox: cross-project inbound from herm (goaldaddy) (x2)
2026-09-11: 21h (21 sessions)
  session 1: 1h [bean-la/jono-meta]
    commit 1: dc90f193 _inbox: cross-project inbound from herm (goaldaddy)
  session 2: 1h [bean-la/salon94-meta]
    commit 1: 62964143 _inbox: cross-project inbound from herm (goaldaddy)
  session 3: 1h [bean-la/brodie-meta]
    commit 1: 3777af37 docs: publish colorway catalog import sheet
    commit 2: 607ebfaa docs: sync hackdaddy lane state from VPS working tree
  session 4: 1h [bean-la/brodie]
    commit 1: 641273c5 Portal: carry forward the 9/10 policy-content record and des...
    commit 2: 3e37f8c4 Portal: theme workflow for the design track, labelled editor...
    commit 3: d3ee76da Portal: record the colour-handle and design-theme decisions ...
  session 5: 1h [bean-la/brodie-meta]
    commit 1: fe279fa1 Ship colorway catalog reshape reports and pin theme cleanup.
    commit 2: 236d4b2c Record Linear resolution cleanup for catalog tickets.
    commit 3: aed01499 Note BRO-28 soft-launch nav polish for call prep.
    commit 4: ae6cb005 Update Shopify theme content datasource
    commit 5: 62370e6e Update Shopify theme cleanup
  session 6: 1h [bean-la/brodie]
    commit 1: acce6328 Portal: the Design theme is the review candidate — reset f...
    commit 2: 1e192b28 Portal: policy-content change-review handoff on the Design t...
  session 7: 1h [bean-la/brodie, bean-la/brodie-meta]
    commit 1: ca7d9a69 Pin shopbrodie-shopify to Builder Looks blog source.
    commit 2: fb781b27 Portal: distinguish the live section-lib catalog from the pl...
    commit 3: 8afa5cd5 Pin theme section-lib catalog and queue the live walkthrough...
  session 8: 1h [bean-la/brodie]
    commit 1: ceaf4be1 Portal: theme strip on /inventory — name, id, storefront a...
    commit 2: b127dee3 Portal: theme table reflects the amended merge rule
  session 9: 1h [bean-la/brodie-meta]
    commit 1: 493e0b1c Draft the Brodie Shopify Admin how-to for Ryan and the shop ...
    commit 2: 63d250f4 docs: serve the Shopify Admin how-to at the public herm docs...
    commit 3: af1d11ff Record the Linear overview rewrite and herm Admin how-to URL...
  session 10: 1h [bean-la/brodie]
    commit 1: 3163644c Portal: executor posts three kinds of status comment to Line...
    commit 2: e30d45a4 Portal: reset may be executor-run on Nick's word; theme rena...
  session 11: 1h [bean-la/brodie-meta]
    commit 1: bf77cb6e docs: share Brodie docs on brodie.bean.studio without the pr...
    commit 2: fdffa4cd docs: correct the Admin how-to against live header, footer, ...
  session 12: 1h [bean-la/brodie]
    commit 1: 90a75726 Portal: policy-content row linked to BRO-37
  session 13: 1h [bean-la/brodie-meta]
    commit 1: 3b468211 docs: say reusable About metaobjects are theme-ready but not...
    commit 2: 08e4180a docs: document live Content section metaobjects for About an...
    commit 3: 54fd917d docs: list Content → Metaobjects in the Admin map
  session 14: 1h [bean-la/brodie]
    commit 1: d833bbb9 Portal: policy-content change review accepted; row moves to ...
  session 15: 1h [bean-la/brodie-meta]
    commit 1: 89071e78 Pin the Shopify theme after dropping Sanity, and say Shared ...
    commit 2: b0258812 Pin the theme About-link interceptor and document the PDP dr...
    commit 3: bcd2b00e Pin brodie-portal at Nick's theme-strip and policy-content r...
    commit 4: b13e5e3b Refresh the Admin how-to and Linear call walk after the PDP ...
    commit 5: 4a2ecd99 Record the Linear Blocked column and client roadmap for the ...
    commit 6: e0a672ad Pin the theme footer grid and 600px policy measure.
    commit 7: 2622995e Point the Admin how-to at the Linear launch board and roadma...
    commit 8: 5e567283 Pin the sub-750px 600px policy measure.
  session 16: 1h [bean-la/brodie]
    commit 1: 4cca18ac Portal: feature the component inventory and Seb's admin user...
    commit 2: 9d8f340d Portal: link Seb's live section library from /inventory and ...
  session 17: 1h [bean-la/brodie-meta]
    commit 1: e9a9a7dd _inbox: cross-project inbound from herm (goaldaddy)
  session 18: 1h [bean-la/brodie]
    commit 1: e0c7d9c4 Portal: 9/11 bi-weekly — Sanity dropped for metafields, pa...
    commit 2: fc1eb788 Portal: content shapes — prose pages one field, structured...
  session 19: 1h [bean-la/brodie-meta]
    commit 1: c75b5102 docs: audit Cursor workflow safety boundaries
    commit 2: 07b74a9c feat: add read-only Cursor workflow preflight
    commit 3: 5da1160e fix: make Cursor preflight clone-safe
    commit 4: 21c3db70 fix: fail when submodules cannot be inspected
    commit 5: a1626943 docs: record Cursor preflight evidence
  session 20: 1h [bean-la/brodie]
    commit 1: d3d78024 Portal: point the next session at the 9/11 handoff
  session 21: 1h [bean-la/brodie-meta]
    commit 1: b9107701 _inbox: cross-project inbound from herm (goaldaddy)
2026-09-15: 8h (4 sessions)
  session 1: 1h [bean-la/brodie-meta]
    commit 1: 6a4ecab3 docs: record BRO-33 and BRO-38 validation evidence
    commit 2: 5dbbfdcb docs: refresh hackdaddy lane state
    commit 3: 36e16f0c docs: inventory BRO-34 meta media candidates
  session 2: 1h [bean-la/brodie-meta]
    commit 1: 13f02f91 Close the section-lib live walk after the in-flight PRs sett...
  session 3: 1h [bean-la/brodie-meta]
    commit 1: 58a3b755 docs: prepare BRO-34 image update dry run
    commit 2: b3b9ab82 docs: normalize BRO-34 media mapping by colour
    commit 3: 3d1b4614 docs: record BRO-34 canonical media matrix and update eviden...
  session 4: 5h [bean-la/brodie-meta, bean-la/jono-meta, bean-la/salon94-meta]
    commit 1: 15142fe5 Ignore local archives
    commit 2: 592089d2 chore: install cursor-guest rule and close versioning inspec...
    commit 3: f0335392 chore: install cursor-guest rule (x2)
    commit 4: f2043d1f docs: add May–July 2026 usage billing summary
    commit 5: ebb0e77b docs: drop case-collision deploy.md; keep canonical DEPLOY.m...
2026-09-16: 5h (4 sessions)
  session 1: 1h [bean-la/brodie-meta]
    commit 1: 6f44fc57 docs: lock live kit identity map and 14,280 combo formula
    commit 2: 069c85b9 docs: scaffold Brodie launch asset intake for Drive share
    commit 3: c7849d75 docs: add Sep 8 Brodie standup notes
    commit 4: 295b319f docs: add CMS and metafield follow-ups
    commit 5: c760fec8 chore: update Shopify theme submodule
    commit 6: 97ef4083 handoff: Shopify CMS info widgets to perky
    commit 7: 472c22c7 chore: update Shopify theme submodule
  session 2: 1h [bean-la/brodie]
    commit 1: 70edaf4c Portal: Overview — attention cards removed, position updat...
  session 3: 2h [bean-la/brodie-meta]
    commit 1: 5f890c7e chore: update Shopify CMS info widgets theme
    commit 2: abbc5adf chore: point Shopify theme at formatted widget assets
    commit 3: 655b1b73 docs: outline Shopify info widget admin workflow
    commit 4: 7ede4bae Add live catalog export/sync to Drive intake mirror.
    commit 5: 11940d36 chore: bump portal pin to origin/main (copy-map overview).
  session 4: 1h [bean-la/brodie]
    commit 1: 86a00dba Portal: 9/16 standup — tab content as page bodies, PDP dem...
2026-09-17: 6h (2 sessions)
  session 1: 5h [bean-la/brodie]
    commit 1: ce234dcd Portal: 9/17 reconciliation — BRO-45 tab pages supersede t...
    commit 2: 83f59b67 Portal: point the copy-map task at the 9/17 review packet �...
    commit 3: 03ce03d5 Portal: copy-map task — group calls and CTA wording approv...
    commit 4: 47827b6b Portal: copy-map task — handoff workbook uploaded; its exp...
    commit 5: 28fc0aec Portal: correct the Suggesting-mode claim; record the decide...
  session 2: 1h [bean-la/brodie-meta]
    commit 1: 9703e433 Merge remote-tracking branch 'origin/main'
2026-09-18: 4h (4 sessions)
  session 1: 1h [bean-la/brodie-meta]
    commit 1: 59eb1081 Add PDP visual QA screenshots
  session 2: 1h [bean-la/brodie-meta]
    commit 1: d51aeafe flag: Linear image attachment integration gap
  session 3: 1h [bean-la/brodie-meta]
    commit 1: 8cb53029 Refresh PDP QA screenshots without cookie modal
    commit 2: 1acdf55e Update Shopify theme for PDP material systems
    commit 3: 283d0873 Capture live PDP material systems screenshots
    commit 4: 9b489a93 Update PDP 50/50 content
    commit 5: f6f4d999 Align material systems carousel with design
    commit 6: 6d067c2a Enable Shopify recommendations for cross-sell
    commit 7: 3654ab28 Refresh PDP screenshots after cross-sell update
    commit 8: 5a7514c0 Fix native product recommendations rendering
  session 4: 1h [bean-la/brodie-meta]
    commit 1: 821086d0 _inbox: cross-project inbound from herm (hackdaddy)
2026-09-19: 1h (1 sessions)
  session 1: 1h [bean-la/brodie]
    commit 1: b3ae1e77 Portal: record the eight durable decisions from the 9/18 end...
2026-09-21: 1h (1 sessions)
  session 1: 1h [bean-la/brodie-meta]
    commit 1: d0cb048a chore: bump shopbrodie-shopify pin
2026-09-22: 3h (3 sessions)
  session 1: 1h [bean-la/brodie-meta, bean-la/jono-meta, bean-la/salon94-meta]
    commit 1: 4aa4f09f backfill Brodie Linear mapping
    commit 2: 18a127ad fix malformed Brodie Linear mapping merge
    commit 3: 66a650c0 add jono Linear project mapping
    commit 4: 56cbf340 add salon94 Linear project mapping
  session 2: 1h [bean-la/brodie-meta]
    commit 1: 375ffcf0 chore: bump shopbrodie-shopify pin after PR #31
    commit 2: 8a2e64b5 docs: packshot import pass + bump theme/portal pins
    commit 3: 0f0bb2d1 chore: bump shopbrodie-shopify pin after PDP gallery thumb f...
    commit 4: ac91a853 docs: live walkthrough evidence + Shopify push-main deploy n...
    commit 5: 4f844cc9 chore: bump shopbrodie-shopify pin after image-responsive me...
    commit 6: 86122620 chore: bump shopbrodie-shopify pin after image responsive pa...
    commit 7: 969c149c chore: bump shopbrodie-shopify pin after disabling PR theme ...
    commit 8: 75b544b0 chore: bump shopbrodie-shopify pin for SETUP preview note
    commit 9: 560483ef chore: bump shopbrodie-shopify pin after pagination layout f...
  session 3: 1h [bean-la/brodie-meta]
    commit 1: ea0fde79 sync Brodie goals, handoffs, and submodule pins
2026-09-25: 5h (2 sessions)
  session 1: 4h [bean-la/brodie]
    commit 1: f258e868 Portal: new batch — finish the product page and stand up t...
    commit 2: fa1c7305 Prompt: D0 — merge PR #33 on Nick's word, then D1 read-onl...
    commit 3: 8b7334a3 Portal: stale-content pass before the 9/25 call
    commit 4: 83b0c0ae Portal: PR #33 hero background merged and verified live — ...
    commit 5: e1db2f2c Prompt: hero background is #eee via PR #34; the 11:15 live r...
    commit 6: 7fea61af Prompt: D2 — Design-theme reset and buy-box candidate on N...
    commit 7: 973fcc10 Prompt: D3 — PDP hero balance (Nick's annotated screenshot...
    commit 8: bdb88ec6 Prompt: D4 — buy column inner container at 536px (Nick's d...
    commit 9: 2c056691 Portal: 9/25 bi-weekly — launch likely Nov 12; About secti...
    commit 10: d61ba985 Prompt: link BRO-73 (About section) and BRO-74 (shoppable-lo...
  session 2: 1h [bean-la/brodie-meta, bean-la/jono-meta, bean-la/salon94-meta]
    commit 1: 68a86a9c config: default active lanes to GPT-6 Luna (x3)
2026-09-26: 2h (2 sessions)
  session 1: 1h [bean-la/brodie-meta, bean-la/jono-meta, bean-la/salon94-meta]
    commit 1: 0b8b87ee config: inherit centralized high thinking default (x3)
    commit 2: f3ef5784 config: inherit centralized GPT-6 high-thinking defaults (x3)
  session 2: 1h [bean-la/brodie-meta]
    commit 1: 50a1fd0a fix: quote Shopify deploy notes in project yaml
2026-09-28: 3h (1 sessions)
  session 1: 3h [bean-la/brodie]
    commit 1: 2ddc75af Prompt: D5 — info track min(50%, 600px) at ≥990 (Nick, 9...
    commit 2: 53eebfe6 Prompt: pdp-buy-box done — PR #35 merged (bb4dc87), D5 rev...
    commit 3: 4ce7cac4 Prompt: D6 — Brodie As Seen On gets optional heading + tex...
    commit 4: e6b5d3d0 Prompt: D6 withdrawn — Ryan uses the existing 50/50 sectio...
    commit 5: de91eeae Prompt: D6 restored — no other section overlays text on a ...
    commit 6: 8bd11e0d Prompt: D6 amendment — intro as its own overlay, not insid...
    commit 7: a823f469 Prompt: D6 done — PR #36 merged (01b9ca3)
2026-09-29: 4h (3 sessions)
  session 1: 1h [bean-la/brodie]
    commit 1: 0afcef66 Prompt: D7 — PDP info column (specs field, accordions, des...
  session 2: 1h [bean-la/brodie-meta]
    commit 1: 6dd57577 chore(BRO-68): record editor theme and measurement map
    commit 2: 54001826 chore(BRO-69): pin provisioned FAQ theme
  session 3: 2h [bean-la/brodie]
    commit 1: 4c300cf4 Prompt: D8 look-picker proof + M7 Look definition (admin, be...
    commit 2: e99d8967 Portal: 9/29 standup — build by 10/16; shoppable-looks pag...
    commit 3: b1ddbffc Prompt: D8 + M7 on hold — standup chose blog posts; Seb sp...
    commit 4: 58fe65ae Prompt: D7 amendment — About this product as a standard co...
    commit 5: 4ae295bc Portal: name the July demos by what they show (the dot, the ...
    commit 6: 6b829030 Portal: Next Steps after the 9/29 standup — looks as blog ...
    commit 7: 0c352d76 Portal: video-host question answered (Shopify-hosted); add t...
2026-09-30: 3h (3 sessions)
  session 1: 1h [bean-la/brodie-meta]
    commit 1: 2408bf77 _inbox: cross-project inbound from herm (goaldaddy)
  session 2: 1h [bean-la/jono-meta]
    commit 1: 28415ea4 _inbox: cross-project inbound from herm (goaldaddy)
  session 3: 1h [bean-la/jono-meta]
    commit 1: d9f46fbc chore: pin pando-platform BEA-54 reporting slice

2026-09: 106h (13.2 days)

grand total: 106h (13.2 days)

flags used:
  --since 2026-09-01
  --until 2026-10-01
  --local
  --show-commits

```
</details>

## Appendix B — GCal-linked session candidates

The following is wrklogr output with `--gcal`; event title and estimated session duration only. No attendee attributes were returned.

<details><summary>Expand dated GCal and commit sessions</summary>

```text
bean-la/brodie-meta: 168 commits
bean-la/jono-meta: 9 commits
bean-la/salon94-meta: 8 commits
bean-la/brodie: 75 commits
calendar: 48 events
total: 260 commits
2026-09-02: 14h (6 sessions)
  session 1: 5h [bean-la/brodie-meta]
  session 2: 1h [bean-la/brodie-meta]
  session 3: 4h [bean-la/brodie-meta]
  session 4: 1h [📅 Dublab Video Catchup]
  session 5: 2h [📅 LIVE // GOGO – The Wavelength: Solo Session]
  session 6: 1h [📅 retry YouTube upload desert]
2026-09-04: 17h (12 sessions)
  session 1: 3h [bean-la/brodie-meta]
  session 2: 1h [bean-la/brodie-meta]
  session 3: 1h [bean-la/brodie-meta]
  session 4: 1h [bean-la/brodie-meta]
  session 5: 2h [bean-la/brodie-meta]
  session 6: 1h [bean-la/brodie-meta]
  session 7: 1h [bean-la/brodie-meta]
  session 8: 1h [bean-la/brodie-meta]
  session 9: 1h [bean-la/brodie-meta]
  session 10: 1h [bean-la/brodie-meta]
  session 11: 3h [bean-la/brodie-meta]
  session 12: 1h [📅 Hold Masha website]
2026-09-05: 1h (1 sessions)
  session 1: 1h [bean-la/brodie-meta]
2026-09-08: 5h (4 sessions)
  session 1: 1h [bean-la/brodie-meta]
  session 2: 2h [bean-la/brodie]
  session 3: 1h [bean-la/brodie]
  session 4: 1h [📅 Brodie / Bean — Tues Standup]
2026-09-09: 8h (7 sessions)
  session 1: 1h [bean-la/brodie]
  session 2: 1h [bean-la/brodie]
  session 3: 1h [📅 Reply Willem]
  session 4: 1h [📅 Dublab Video Catchup]
  session 5: 1h [📅 Figure out Airbnb]
  session 6: 1h [📅 Reply to Wilm]
  session 7: 2h [📅 Boys din!!]
2026-09-10: 10h (6 sessions)
  session 1: 4h [bean-la/brodie]
  session 2: 1h [bean-la/brodie-meta]
  session 3: 1h [bean-la/jono-meta]
  session 4: 1h [bean-la/brodie-meta, bean-la/salon94-meta]
  session 5: 2h [📅 RERUN // Alex Pelly w/ Nathaniel Eras – PELLYVISION]
  session 6: 1h [📅 Wally time]
2026-09-11: 23h (23 sessions)
  session 1: 1h [bean-la/jono-meta]
  session 2: 1h [bean-la/salon94-meta]
  session 3: 1h [bean-la/brodie-meta]
  session 4: 1h [bean-la/brodie]
  session 5: 1h [bean-la/brodie-meta]
  session 6: 1h [bean-la/brodie]
  session 7: 1h [bean-la/brodie, bean-la/brodie-meta]
  session 8: 1h [bean-la/brodie]
  session 9: 1h [bean-la/brodie-meta]
  session 10: 1h [bean-la/brodie]
  session 11: 1h [bean-la/brodie-meta]
  session 12: 1h [bean-la/brodie]
  session 13: 1h [bean-la/brodie-meta]
  session 14: 1h [bean-la/brodie]
  session 15: 1h [bean-la/brodie-meta]
  session 16: 1h [bean-la/brodie]
  session 17: 1h [bean-la/brodie-meta]
  session 18: 1h [bean-la/brodie]
  session 19: 1h [bean-la/brodie-meta]
  session 20: 1h [bean-la/brodie]
  session 21: 1h [bean-la/brodie-meta]
  session 22: 1h [📅 Brodie / Bean — Bi-weekly Review]
  session 23: 1h [📅 Wally x Bean]
2026-09-15: 8h (4 sessions)
  session 1: 1h [bean-la/brodie-meta]
  session 2: 1h [bean-la/brodie-meta]
  session 3: 1h [bean-la/brodie-meta]
  session 4: 5h [bean-la/brodie-meta, bean-la/jono-meta, bean-la/salon94-meta]
2026-09-16: 17h (8 sessions)
  session 1: 1h [bean-la/brodie-meta]
  session 2: 1h [bean-la/brodie]
  session 3: 2h [bean-la/brodie-meta]
  session 4: 1h [bean-la/brodie]
  session 5: 1h [📅 SOS Airtable]
  session 6: 2h [📅 LIVE // ash. – (very rare): House Werkout]
  session 7: 1h [📅 Brodie / Bean — Tues Standup]
  session 8: 8h [📅 Bushwick farmers]
2026-09-17: 31h (4 sessions)
  session 1: 5h [bean-la/brodie]
  session 2: 1h [bean-la/brodie-meta]
  session 3: 24h [📅 Mark said us open free as fuck]
  session 4: 1h [📅 Bat signal]
2026-09-18: 5h (5 sessions)
  session 1: 1h [bean-la/brodie-meta]
  session 2: 1h [bean-la/brodie-meta]
  session 3: 1h [bean-la/brodie-meta]
  session 4: 1h [bean-la/brodie-meta]
  session 5: 1h [📅 End of Week Catchup]
2026-09-19: 1h (1 sessions)
  session 1: 1h [bean-la/brodie]
2026-09-21: 3h (3 sessions)
  session 1: 1h [bean-la/brodie-meta]
  session 2: 1h [📅 Therpy]
  session 3: 1h [📅 Airtable SASSY Gang]
2026-09-22: 9h (8 sessions)
  session 1: 1h [bean-la/brodie-meta, bean-la/jono-meta, bean-la/salon94-meta]
  session 2: 1h [bean-la/brodie-meta]
  session 3: 1h [bean-la/brodie-meta]
  session 4: 1h [📅 Call Jessica dowel Grampa figure out Airbnb]
  session 5: 2h [📅 PRE-REC // Photay & Celia Hollander – Extravagant Frequencies: Jon]
  session 6: 1h [📅 Consider magz Q]
  session 7: 1h [📅 The Ranch x Bean]
  session 8: 1h [📅 Brodie / Bean — Tues Standup]
2026-09-25: 8h (4 sessions)
  session 1: 4h [bean-la/brodie]
  session 2: 1h [bean-la/brodie-meta, bean-la/jono-meta, bean-la/salon94-meta]
  session 3: 2h [📅 Nicholas Jaar on scholes]
  session 4: 1h [📅 Brodie / Bean — Bi-weekly Review]
2026-09-26: 11h (6 sessions)
  session 1: 1h [bean-la/brodie-meta, bean-la/jono-meta, bean-la/salon94-meta]
  session 2: 1h [bean-la/brodie-meta]
  session 3: 1h [📅 Ded letter Juan]
  session 4: 2h [📅 Mallory 40 @ Kevin’s]
  session 5: 1h [📅 Left field smoke stack]
  session 6: 5h [📅 Printed matter after greenpoint]
2026-09-28: 4h (2 sessions)
  session 1: 3h [bean-la/brodie]
  session 2: 1h [📅 Left field pickup, suit at ezzys, gym]
2026-09-29: 6h (5 sessions)
  session 1: 1h [bean-la/brodie]
  session 2: 1h [bean-la/brodie-meta]
  session 3: 2h [bean-la/brodie]
  session 4: 1h [📅 Brodie / Bean — Tues Standup]
  session 5: 1h [📅 Raya]
2026-09-30: 8h (6 sessions)
  session 1: 1h [bean-la/brodie-meta]
  session 2: 1h [bean-la/jono-meta]
  session 3: 1h [bean-la/jono-meta]
  session 4: 1h [📅 Seb & Willem at Terrain Office]
  session 5: 1h [📅 Dublab Video Catchup]
  session 6: 3h [📅 SEB]

2026-09: 189h (23.6 days)

grand total: 189h (23.6 days)

flags used:
  --since 2026-09-01
  --until 2026-10-01
  --local
  --gcal

```
</details>
