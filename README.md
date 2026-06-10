# d-slop

A portable skill for Codex and Claude Code that edits prose toward a concrete, plainspoken style.

Use it when a draft sounds inflated, generic, or too much like model-written copy. The skill keeps the useful idea, then removes filler, stock transitions, fake significance, and padded phrasing.

## Plain-English Version

`d-slop` is a writing cleanup skill.

It helps Codex or Claude Code take a draft that sounds too polished, vague, or AI-written and make it sound more direct. It does not try to make the writing fancy. It cuts the mush.

Use it for:

- announcements
- bios
- posts
- explanations
- workshop copy
- public project notes
- anything that sounds too generic

You can ask for it in normal language:

```text
Use d-slop on this.
```

```text
Make this sound less AI-written.
```

```text
Keep the facts, but make the writing more concrete.
```

## When To Use It

Ask for it when you want writing that is:

- concise
- specific
- calm
- practical
- human without being casual for its own sake

Example prompts:

```text
Use d-slop to rewrite this announcement.
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
git clone https://github.com/daniel-p-green/d-slop.git
cd d-slop
./scripts/install-skill.sh --target both
```

After installing, restart or reload Codex or Claude Code so the new skill is picked up.

Custom skill directories are supported:

```bash
CODEX_SKILLS_DIR="$HOME/.codex/skills" \
CLAUDE_SKILLS_DIR="$HOME/.claude/skills" \
./scripts/install-skill.sh --target both
```

## Layout

```text
skill/d-slop/SKILL.md
skill/d-slop/references/style-rules.md
skill/d-slop/examples/rewrite-examples.md
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
