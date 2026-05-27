#!/usr/bin/env bash
# scripts/update.sh — refresh auto-update blocks in README.md
#
# Required env:
#   GH_TOKEN      — github token for API access (defaults to gh CLI auth)
#   GITHUB_USER   — github username (defaults to ozpool)
#   README        — readme path (defaults to README.md in CWD)
#
# Idempotent. Replaces content between paired markers in README:
#   <!-- START:NAME -->  ...  <!-- END:NAME -->
#
# Blocks refreshed:
#   building       — own public repos (top by stars, with description)
#   outflow        — PRs the user opened in other repos, grouped by repo
#   issues-open    — open issues the user filed in other repos
#   issues-closed  — closed issues the user filed in other repos

set -euo pipefail

USER_NAME="${GITHUB_USER:-ozpool}"
README_PATH="${README:-README.md}"
PROFILE_REPO="${USER_NAME}/${USER_NAME}"
MAX_ORGS=10
MAX_ROWS=10
MAX_BUILDING=12

require() { command -v "$1" >/dev/null 2>&1 || { echo "missing dependency: $1" >&2; exit 1; }; }
require gh
require jq
require awk

WORK=$(mktemp -d)
trap 'rm -rf "$WORK"' EXIT

############################################
# 1. building — own public repos
############################################
gh api "users/${USER_NAME}/repos?per_page=100&type=owner&sort=updated" --paginate \
  | jq -s 'flatten' > "$WORK/repos.json"

jq -r --arg profile "$PROFILE_REPO" --argjson n "$MAX_BUILDING" '
  [ .[]
    | select(.fork | not)
    | select(.archived | not)
    | select(.private | not)
    | select(.full_name != $profile)
  ]
  | sort_by(-(.stargazers_count // 0), -(.pushed_at | fromdateiso8601))
  | .[0:$n]
  | map(
      "<details>\n"
      + "<summary><b><a href=\"\(.html_url)\">\(.name)</a></b></summary>\n\n"
      + ((.description // "_no description_") | gsub("[\r\n]+"; " "))
      + (if ((.topics // []) | length) > 0
         then "\n\ntopics: " + ((.topics // []) | map("`" + . + "`") | join(" "))
         else "" end)
      + "\n\n</details>"
    )
  | join("\n\n")
' "$WORK/repos.json" > "$WORK/building.md"

if [ -z "$(tr -d '[:space:]' < "$WORK/building.md")" ]; then
  echo "_no public repos with descriptions yet._" > "$WORK/building.md"
fi

############################################
# helper: render <details> blocks grouped by repo
############################################
render_group() {
  local items_file="$1"
  local kind="$2"   # "pr" or "issue"

  jq -r --arg user "$USER_NAME" --arg kind "$kind" \
        --argjson maxOrgs "$MAX_ORGS" --argjson maxRows "$MAX_ROWS" '
    if length == 0 then ""
    else
      group_by(.repository_url)
      | map({
          repo: (.[0].repository_url | sub("^https://api.github.com/repos/"; "")),
          count: length,
          rows: (sort_by(-.number) | .[0:$maxRows])
        })
      | sort_by(-.count)
      | .[0:$maxOrgs]
      | map(
          "<details>\n"
          + "<summary><b><a href=\"https://github.com/\(.repo)\">\(.repo)</a></b> · "
          + (.count | tostring) + " "
          + (if $kind == "pr"
             then ("PR" + (if .count == 1 then "" else "s" end))
             else ("issue" + (if .count == 1 then "" else "s" end))
             end)
          + (if $kind == "pr"
             then (" · <a href=\"https://github.com/\(.repo)/pulls?q=author%3A" + $user + "+is%3Apr\">all →</a>")
             else "" end)
          + "</summary>\n\n"
          + ((.rows | map(
              "- [`#\(.number)`](\(.html_url)) — "
              + (.title | gsub("\\|"; "\\|") | gsub("[\r\n]+"; " "))
              + (if $kind == "pr"
                 then " · `"
                      + (if .pull_request.merged_at != null then "merged"
                         elif .state == "open" then "open"
                         else "closed" end)
                      + "`"
                 else "" end)
            )) | join("\n"))
          + "\n\n</details>"
        )
      | join("\n\n")
    end
  ' "$items_file"
}

############################################
# 2. outflow — PRs the user opened in other repos
############################################
gh api -X GET "search/issues" -f q="is:pr is:public author:${USER_NAME} -user:${USER_NAME}" -f per_page=100 --paginate \
  | jq -s '[.[].items[]]' > "$WORK/prs.json"

render_group "$WORK/prs.json" pr > "$WORK/outflow.md"
if [ -z "$(tr -d '[:space:]' < "$WORK/outflow.md")" ]; then
  echo "_no open-source contributions indexed yet._" > "$WORK/outflow.md"
fi

############################################
# 3. issues-open
############################################
gh api -X GET "search/issues" -f q="is:issue is:open is:public author:${USER_NAME} -user:${USER_NAME}" -f per_page=100 --paginate \
  | jq -s '[.[].items[]]' > "$WORK/iopen.json"

render_group "$WORK/iopen.json" issue > "$WORK/issues-open.md"
if [ -z "$(tr -d '[:space:]' < "$WORK/issues-open.md")" ]; then
  echo "_no open issues filed._" > "$WORK/issues-open.md"
fi

############################################
# 4. issues-closed
############################################
gh api -X GET "search/issues" -f q="is:issue is:closed is:public author:${USER_NAME} -user:${USER_NAME}" -f per_page=100 --paginate \
  | jq -s '[.[].items[]]' > "$WORK/iclosed.json"

render_group "$WORK/iclosed.json" issue > "$WORK/issues-closed.md"
if [ -z "$(tr -d '[:space:]' < "$WORK/issues-closed.md")" ]; then
  echo "_no closed issues filed._" > "$WORK/issues-closed.md"
fi

############################################
# replace blocks in README — preserves markers
############################################
replace_block() {
  local name="$1"
  local body_file="$2"
  local start="<!-- START:${name} -->"
  local end="<!-- END:${name} -->"

  grep -qF "$start" "$README_PATH" || { echo "marker missing: $start" >&2; exit 1; }
  grep -qF "$end"   "$README_PATH" || { echo "marker missing: $end"   >&2; exit 1; }

  awk -v start="$start" -v end="$end" -v body_file="$body_file" '
    BEGIN {
      body = ""
      while ((getline line < body_file) > 0) {
        body = (body == "" ? line : body "\n" line)
      }
      close(body_file)
    }
    {
      if (skip) {
        if (index($0, end) > 0) { print body; print; skip = 0 }
        next
      }
      print
      if (index($0, start) > 0) { skip = 1 }
    }
  ' "$README_PATH" > "$README_PATH.tmp"
  mv "$README_PATH.tmp" "$README_PATH"
}

replace_block building       "$WORK/building.md"
replace_block outflow        "$WORK/outflow.md"
replace_block issues-open    "$WORK/issues-open.md"
replace_block issues-closed  "$WORK/issues-closed.md"

echo "✓ README refreshed"
