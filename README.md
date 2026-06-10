# Grounded Writing Style

A portable skill for Codex and Claude Code that edits prose toward a concrete, plainspoken style.

Use it when a draft sounds inflated, generic, or too much like model-written copy. The skill keeps the useful idea, then removes filler, stock transitions, fake significance, and padded phrasing.

## When To Use It

Ask for it when you want writing that is:

- concise
- specific
- calm
- practical
- human without being casual for its own sake

Example prompts:

```text
Use grounded-writing-style to rewrite this announcement.
```

```text
Make this less generic and remove AI vocabulary.
```

```text
Edit this into a calm, concrete explanation with no filler.
```

## Install

Clone the repo, then install into Codex, Claude Code, or both:

```bash
git clone https://github.com/daniel-p-green/grounded-writing-style.git
cd grounded-writing-style
./scripts/install-skill.sh --target both
```

Custom skill directories are supported:

```bash
CODEX_SKILLS_DIR="$HOME/.codex/skills" \
CLAUDE_SKILLS_DIR="$HOME/.claude/skills" \
./scripts/install-skill.sh --target both
```

## Layout

```text
skill/grounded-writing-style/SKILL.md
skill/grounded-writing-style/references/style-rules.md
skill/grounded-writing-style/examples/rewrite-examples.md
scripts/check.sh
scripts/install-skill.sh
```

The same `SKILL.md` works as a local Codex skill and a local Claude Code skill.

## Check

```bash
./scripts/check.sh
```

The check script verifies the required files, frontmatter, install script syntax, public docs, and local-path hygiene.

## License

MIT
