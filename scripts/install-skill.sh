#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source_dir="$repo_root/skill/d-slop"
old_source_dir="$repo_root/skill/grounded-writing-style"
target="both"
force=0
copy_mode=0

usage() {
  cat <<'USAGE'
Usage: ./scripts/install-skill.sh [--target codex|claude|both] [--force] [--copy]

Installs d-slop into local skill directories.

Environment:
  CODEX_SKILLS_DIR   Defaults to $HOME/.codex/skills
  CLAUDE_SKILLS_DIR  Defaults to $HOME/.claude/skills

Options:
  --target   Install target. Default: both
  --force    Replace an existing d-slop skill at the target
  --copy     Copy files instead of creating a symlink
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)
      [[ $# -ge 2 ]] || { usage >&2; exit 2; }
      target="$2"
      shift 2
      ;;
    --force)
      force=1
      shift
      ;;
    --copy)
      copy_mode=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      printf 'Unknown argument: %s\n' "$1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

[[ -d "$source_dir" ]] || { printf 'Missing source skill directory: %s\n' "$source_dir" >&2; exit 1; }

install_one() {
  local label="$1"
  local skills_dir="$2"
  local dest="$skills_dir/d-slop"
  local old_dest="$skills_dir/grounded-writing-style"

  mkdir -p "$skills_dir"

  if [[ -L "$old_dest" && "$(readlink "$old_dest")" == "$old_source_dir" ]]; then
    rm "$old_dest"
    printf 'Removed old %s skill link: %s\n' "$label" "$old_dest"
  fi

  if [[ -e "$dest" || -L "$dest" ]]; then
    if [[ "$force" -ne 1 ]]; then
      printf '%s already exists at %s. Re-run with --force to replace it.\n' "$label" "$dest" >&2
      exit 1
    fi
    rm -rf "$dest"
  fi

  if [[ "$copy_mode" -eq 1 ]]; then
    mkdir -p "$dest"
    (cd "$source_dir" && tar cf - .) | (cd "$dest" && tar xf -)
  else
    ln -s "$source_dir" "$dest"
  fi

  [[ -f "$dest/SKILL.md" ]] || { printf '%s install failed: SKILL.md missing\n' "$label" >&2; exit 1; }
  printf 'Installed %s skill: %s\n' "$label" "$dest"
}

case "$target" in
  codex)
    install_one "Codex" "${CODEX_SKILLS_DIR:-$HOME/.codex/skills}"
    ;;
  claude)
    install_one "Claude Code" "${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
    ;;
  both)
    install_one "Codex" "${CODEX_SKILLS_DIR:-$HOME/.codex/skills}"
    install_one "Claude Code" "${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
    ;;
  *)
    printf 'Invalid --target value: %s\n' "$target" >&2
    usage >&2
    exit 2
    ;;
esac
