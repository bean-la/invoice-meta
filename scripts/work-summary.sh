#!/usr/bin/env bash
# ═══════════════════════════════════════════════════════════════════════
# work-summary — per-project monthly work summary (G012 Slice C, build half)
#
# Given a project-meta repo + month, extract the landed work:
#   - closed goals (status done/complete/completed/closed in goals/*.md, or
#     goaldaddy close-out commits touching goals/ in the month)
#   - committed handoffs (continues/*.md committed in the month)
#   - session artifacts (brn call artifacts.query, tenant-scoped)
#
# Output: a markdown summary the project agent confirms before billing
# (side-channel is invoicedaddy's step 3). Feeds the notion-invoice flow.
#
# Usage:
#   work-summary.sh --project brodie --month 2026-07
#   work-summary.sh --project brodie --month 2026-07 --repo /path/to/brodie-meta
#
# Reads projects.yml (herm-meta, G008 allowlist) for tenant + repo mapping.
# Only projects in the allowlist are eligible — no ad-hoc billing.
# ═══════════════════════════════════════════════════════════════════════
set -euo pipefail

# ── defaults ───────────────────────────────────────────────────────────
HERM_META="${HERM_META:-/home/herm/repos/github.com/bean-la/herm-meta}"
PROJECTS_YML="${HERM_META}/projects.yml"
MONTH=""
PROJECT=""
REPO_OVERRIDE=""

usage() {
  echo "usage: work-summary.sh --project <slug> --month YYYY-MM [--repo <path>]" >&2
  exit 1
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project) PROJECT="$2"; shift 2 ;;
    --month) MONTH="$2"; shift 2 ;;
    --repo) REPO_OVERRIDE="$2"; shift 2 ;;
    *) echo "unknown option: $1" >&2; usage ;;
  esac
done

[[ -n "$PROJECT" && -n "$MONTH" ]] || usage
[[ "$MONTH" =~ ^[0-9]{4}-[0-9]{2}$ ]] || { echo "month must be YYYY-MM: $MONTH" >&2; exit 1; }

# ── resolve project from projects.yml allowlist ────────────────────────
if [[ ! -f "$PROJECTS_YML" ]]; then
  echo "projects.yml not found at $PROJECTS_YML" >&2
  exit 1
fi

TENANT=""
REPO=""
IN_SECTION=0
while IFS= read -r line; do
  if [[ "$line" =~ ^[[:space:]]{2}([a-z0-9_-]+):[[:space:]]*$ ]]; then
    slug="${BASH_REMATCH[1]}"
    if [[ "$slug" == "$PROJECT" ]]; then IN_SECTION=1; else IN_SECTION=0; fi
  elif [[ $IN_SECTION -eq 1 && "$line" =~ ^[[:space:]]{4}tenant:[[:space:]]*([a-z0-9_-]+) ]]; then
    TENANT="${BASH_REMATCH[1]}"
  elif [[ $IN_SECTION -eq 1 && "$line" =~ ^[[:space:]]{4}repo:[[:space:]]*([a-zA-Z0-9_./-]+) ]]; then
    REPO="${BASH_REMATCH[1]}"
  fi
done < "$PROJECTS_YML"

if [[ -z "$TENANT" || -z "$REPO" ]]; then
  echo "project '$PROJECT' not in projects.yml allowlist (G008) — refusing" >&2
  exit 1
fi

# ── repo path ──────────────────────────────────────────────────────────
if [[ -n "$REPO_OVERRIDE" ]]; then
  REPO_PATH="$REPO_OVERRIDE"
else
  REPO_PATH="/home/herm/repos/github.com/bean-la/${REPO#*/}"
fi
[[ -d "$REPO_PATH/.git" ]] || { echo "repo not found at $REPO_PATH" >&2; exit 1; }

MONTH_START="${MONTH}-01"
MONTH_END=$(date -u -d "$MONTH_START +1 month" +%Y-%m-%d 2>/dev/null || date -u -j -v+1m -f "%Y-%m-%d" "$MONTH_START" +%Y-%m-%d)

# ── 1. closed goals ────────────────────────────────────────────────────
echo "# ${PROJECT} — work summary for ${MONTH}"
echo ""
echo "## Closed goals"
CLOSED_GOALS=$(grep -lE "^status:[[:space:]]*(done|complete|completed|closed)" "$REPO_PATH/goals/"*.md 2>/dev/null || true)
if [[ -n "$CLOSED_GOALS" ]]; then
  for g in $CLOSED_GOALS; do
    title=$(grep "^title:" "$g" | head -1 | sed 's/^title:[[:space:]]*//')
    gid=$(grep "^goal_id:" "$g" | head -1 | sed 's/^goal_id:[[:space:]]*//')
    # Check if the close-out commit landed in the month
    closed_in_month=$(git -C "$REPO_PATH" log --since="${MONTH_START}T00:00:00" --until="${MONTH_END}T00:00:00" --oneline -n 1 -- "$g" 2>/dev/null || true)
    if [[ -n "$closed_in_month" ]]; then
      echo "- **${gid}** ${title} — closed (commit ${closed_in_month%% *})"
    else
      echo "- **${gid}** ${title} — status done (no goals/ commit this month)"
    fi
  done
else
  echo "- (none)"
fi

# ── 2. committed handoffs ──────────────────────────────────────────────
echo ""
echo "## Handoffs committed in ${MONTH}"
HANDOFFS=$(git -C "$REPO_PATH" log --since="${MONTH_START}T00:00:00" --until="${MONTH_END}T00:00:00" --name-only --format="COMMIT %h %s" -- "continues/*.md" 2>/dev/null | grep -E "^continues/|^COMMIT" | head -60 || true)
if [[ -n "$HANDOFFS" ]]; then
  echo "$HANDOFFS" | while IFS= read -r line; do
    if [[ "$line" =~ ^COMMIT ]]; then
      echo "- ${line#COMMIT }"
    fi
  done
else
  echo "- (none)"
fi

# ── 3. session artifacts (herm-core HTTP, tenant-scoped) ──────────────────
echo ""
echo "## Session artifacts (tenant=${TENANT})"
CORE_BASE="${HERM_CORE_BASE:-http://localhost:8787}"
CORE_TOKEN="${HERM_CORE_API_TOKEN:-}"
if [[ -z "$CORE_TOKEN" ]]; then
  # Try to pull from the invoice-meta .env (gitignored, local only)
  ENV_FILE="/home/herm/repos/github.com/bean-la/invoice-meta/.env"
  if [[ -f "$ENV_FILE" ]]; then
    CORE_TOKEN=$(grep "^HERM_CORE_API_TOKEN=" "$ENV_FILE" | cut -d= -f2- | tr -d '"' || true)
  fi
fi
ART_OUT=$(curl -s -H "X-API-Token: ${CORE_TOKEN}" -H "x-herm-tenant-slug: ${TENANT}" "${CORE_BASE}/v1/session-artifacts?limit=200" 2>/dev/null | MONTH="${MONTH}" python3 -c '
import json, sys, os
from datetime import datetime
month = os.environ.get("MONTH", "")  # YYYY-MM
try:
    d = json.load(sys.stdin)
except Exception:
    print("  (artifacts query failed)")
    sys.exit(0)
if isinstance(d, dict) and d.get("error"):
    err = d.get("error")
    print(f"  (API error: {err})")
    sys.exit(0)
total = 0
sessions = set()
MONTHS = {"Jan":"01","Feb":"02","Mar":"03","Apr":"04","May":"05","Jun":"06","Jul":"07","Aug":"08","Sep":"09","Oct":"10","Nov":"11","Dec":"12"}
for s in d.get("sessions", []):
    sid = s.get("session_id", "")
    for a in s.get("artifacts", []):
        ts = str(a.get("ts", ""))
        # ts is a JS Date string: "Tue Aug 11 2026 15:02:47 GMT+0000"
        try:
            parts = ts.split()
            mon = MONTHS.get(parts[1], "")
            year = parts[3]
            if year + "-" + mon == month:
                total += 1
                sessions.add(sid)
        except Exception:
            pass
print(f"  {total} artifacts across {len(sessions)} sessions in {month} (by artifact work-date)")
' 2>/dev/null || echo "  (artifacts query failed)")
  echo "$ART_OUT"

# ── footer ─────────────────────────────────────────────────────────────
echo ""
echo "---"
echo "Generated $(date -u +%Y-%m-%dT%H:%M:%SZ) | repo: ${REPO_PATH} | tenant: ${TENANT}"
echo "Confirm with the project agent before billing (G012 side-channel guard)."
