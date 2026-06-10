#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
skill_dir="$repo_root/skill/d-slop"
skill_file="$skill_dir/SKILL.md"

fail() {
  printf 'ERROR: %s\n' "$1" >&2
  exit 1
}

require_file() {
  [[ -f "$1" ]] || fail "missing file: ${1#$repo_root/}"
}

require_file "$repo_root/README.md"
require_file "$repo_root/AGENTS.md"
require_file "$repo_root/LICENSE"
require_file "$skill_file"
require_file "$skill_dir/references/style-rules.md"
require_file "$skill_dir/examples/rewrite-examples.md"
require_file "$skill_dir/agents/openai.yaml"
require_file "$repo_root/scripts/install-skill.sh"

grep -q '^---$' "$skill_file" || fail "SKILL.md missing YAML frontmatter delimiter"
grep -q '^name: d-slop$' "$skill_file" || fail "SKILL.md missing expected name"
grep -q '^description: .*less AI-written' "$skill_file" || fail "SKILL.md description lacks concrete trigger language"
grep -q '## Workflow' "$skill_file" || fail "SKILL.md missing workflow"
grep -q 'references/style-rules.md' "$skill_file" || fail "SKILL.md does not reference style-rules.md"
grep -q 'examples/rewrite-examples.md' "$skill_file" || fail "SKILL.md does not reference rewrite examples"

grep -q 'Claude Code' "$repo_root/README.md" || fail "README must mention Claude Code"
grep -q 'Codex' "$repo_root/README.md" || fail "README must mention Codex"
grep -q './scripts/install-skill.sh --target both' "$repo_root/README.md" || fail "README missing install example"

scan_targets=(
  "$repo_root/README.md"
  "$repo_root/AGENTS.md"
  "$skill_dir"
  "$repo_root/scripts/install-skill.sh"
)

if grep -RInE '/Users/danielgreen|TODO|REPLACE_ME|YOUR_' "${scan_targets[@]}" >/tmp/d-slop-check.txt; then
  cat /tmp/d-slop-check.txt >&2
  fail "public files contain local paths or placeholders"
fi

bash -n "$repo_root/scripts/install-skill.sh"
bash -n "$repo_root/scripts/check.sh"

[[ -x "$repo_root/scripts/check.sh" ]] || fail "scripts/check.sh must be executable"
[[ -x "$repo_root/scripts/install-skill.sh" ]] || fail "scripts/install-skill.sh must be executable"

printf 'OK: d-slop skill package validated\n'
