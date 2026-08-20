#!/usr/bin/env bash
# tidy-docs.sh — reusable doc/artifact tidy pattern for any `-meta` repo (D-TIDY).
#
# One command to enforce the archive taxonomy across the -meta artifact layer:
#   goals/  brane/_inbox/  continues/  _docs/
# Plus purge of git-ignored machine-local worktree dirs (_wtree/).
#
# ARCHIVE (keep, clustered): resolved/closed/done artifacts move to *_resolved/ or
#   _archived/ — git-tracked, recoverable, but off the live board.
# PURGE (remove, git-ignored only): machine-local worktree dirs. Never purges a
#   git-tracked file (those archive instead; git history is the recovery path).
#
# Effect-TS note: this is intentionally bash (zero toolchain, runs in any -meta).
# A future `brn docs tidy|archive` (Effect TS, brn layer) may absorb this — see
# _docs/archive-pattern.md.
#
# Usage:
#   _scripts/tidy-docs.sh [--dry-run] [--move-goals] [--move-flags]
#                         [--archive-docs] [--purge-wtree] [--report]
#   default (no flags) = dry-run report of what WOULD change
#   --apply  = perform all moves + purge (after reviewing the dry-run)
#   --purge-wtree = also rm -rf git-ignored _wtree/ subdirs (machine-local only)

set -euo pipefail
META="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$META"

MOVE_GOALS=0; MOVE_FLAGS=0; ARCHIVE_DOCS=0; PURGE_WTREE=0; REPORT=0; APPLY=0
for a in "$@"; do
  case "$a" in
    --move-goals) MOVE_GOALS=1 ;;
    --move-flags) MOVE_FLAGS=1 ;;
    --archive-docs) ARCHIVE_DOCS=1 ;;
    --purge-wtree) PURGE_WTREE=1 ;;
    --report) REPORT=1 ;;
    --apply) APPLY=1 ;;
    --dry-run) ;;
    *) echo "unknown arg: $a" >&2; exit 2 ;;
  esac
done
[ "$APPLY" = 1 ] && MOVE_GOALS=1 MOVE_FLAGS=1 ARCHIVE_DOCS=1 PURGE_WTREE=1

do_move() { # do_move <src> <dest_dir> [desc]
  local src="$1" dest="$2" desc="${3:-}"
  if [ ! -e "$src" ]; then return; fi
  if [ "$APPLY" = 1 ]; then
    mkdir -p "$dest"
    git mv "$src" "$dest/" 2>/dev/null || mv "$src" "$dest/"
    echo "  moved: $(basename "$src") → $dest/"
  else
    echo "  [dry-run] would move: $(basename "$src") → $dest/ $desc"
  fi
}

echo "== tidy-docs.sh on $(basename "$META") (apply=$APPLY) =="

# 1. Goals: archive done/completed (keep working/parked).
if [ "$MOVE_GOALS" = 1 ] || [ "$REPORT" = 1 ]; then
  echo "— goals: archive done/completed"
  for g in goals/G0*.md; do
    [ -e "$g" ] || continue
    s=$(grep -m1 '^status:' "$g" 2>/dev/null | cut -d: -f2 | tr -d ' ' || true)
    case "$s" in
      done|completed) do_move "$g" "goals/_archived" "(status=$s)" ;;
    esac
  done
fi

# 2. Flags: move resolved/closed/done to _resolved/ (keep open/in-progress/parked/working/blank).
if [ "$MOVE_FLAGS" = 1 ] || [ "$REPORT" = 1 ]; then
  echo "— flags: archive resolved/closed/done"
  for f in brane/_inbox/flag-*.md; do
    [ -e "$f" ] || continue
    s=$(grep -m1 '^status:' "$f" 2>/dev/null | cut -d: -f2 | sed 's/#.*//' | tr -d ' ' || true)
    case "$s" in
      resolved|closed|done) do_move "$f" "brane/_inbox/_resolved" "(status=$s)" ;;
    esac
  done
  echo "  (kept in main: open/in-progress/parked/working/blank-status — review manually)"
fi

# 3. _docs: archive one-offs/stale. CURATED list — add paths here as superseded.
if [ "$ARCHIVE_DOCS" = 1 ] || [ "$REPORT" = 1 ]; then
  echo "— _docs: archive superseded one-offs (curated)"
  mkdir -p _archived/_docs
  for d in \
    _docs/handoff-herdr-lifecycle.md \
    _docs/handoff-herdr-brn-boundary-audit.md \
    _docs/handoff-sidecar-v4-data-shape-gallery.md \
    _docs/herdr-state-stuck-working-patch.md \
    _docs/analysis-mailbox-mcp-vs-brn.md \
    _docs/cursor-vs-hrm-brane-tooling-review.md \
    _docs/codex-vs-hrm-brane-tooling-review.md \
    _docs/G035-phase0-capability-matrix.md \
    _docs/phase-plan-2026-08-14.md \
    ; do
    do_move "$d" "_archived/_docs"
  done
fi

# 4. Purge git-ignored machine-local worktree dirs.
if [ "$PURGE_WTREE" = 1 ]; then
  echo "— purge git-ignored _wtree/ (machine-local)"
  if [ -d _wtree ]; then
    for d in _wtree/*/; do
      [ -d "$d" ] || continue
      if git check-ignore "$d" >/dev/null 2>&1; then
        if [ "$APPLY" = 1 ]; then
          echo "  purged: $d"; rm -rf "$d"
        else
          echo "  [dry-run] would purge: $d"
        fi
      fi
    done
  fi
fi

echo "== done. Review 'git status' before committing. =="
