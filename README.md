# d-slop

Clean up AI-sounding knowledge work.

`d-slop` is a small skill for Codex and Claude Code. It helps turn drafts, notes, summaries, posts, briefs, and explanations into writing that sounds more direct, concrete, and human.

The name is blunt on purpose: it removes the slop. Not the idea. The slop.

## What It Does

AI drafts often come back smooth but mushy. They explain too much, lean on vague phrases, and make ordinary work sound more dramatic than it is.

`d-slop` pushes the writing back toward the real thing:

- specific facts
- plain language
- shorter sentences when they help
- fewer stock transitions
- less fake importance
- more useful detail

This is for knowledge work: the daily writing people do when they are trying to explain, decide, teach, summarize, share, or persuade.

## Before And After

Before:

> This initiative highlights the importance of fostering collaboration and underscores the pivotal role of experimentation in shaping the future of AI-enabled work.

After:

> We ran the workflow with real notes, found where the draft got vague, and rewrote the parts someone would actually have to use.

That is the point. Less ceremony. More signal.

## Good Uses

Use `d-slop` for:

- meeting summaries
- project updates
- LinkedIn posts
- workshop copy
- internal notes
- public bios
- announcement drafts
- course or event descriptions
- explanations of messy ideas
- AI-generated drafts that sound too generic

## How To Ask For It

You can ask in normal language:

```text
Use d-slop on this.
```

```text
Make this sound less AI-written.
```

```text
Keep the facts, but make the writing more concrete.
```

```text
Clean this up for a smart nontechnical reader.
```

## What It Will Not Do

`d-slop` should not:

- make the writing edgy just to be edgy
- turn everything casual
- strip out needed nuance
- invent facts or examples
- add a motivational ending
- make simple work sound bigger than it is

The goal is not a "brand voice." The goal is usable writing.

## Install

If you use Codex or Claude Code, copy and paste these commands:

```bash
git clone https://github.com/daniel-p-green/d-slop.git
cd d-slop
./scripts/install-skill.sh --target both
```

Then restart or reload Codex or Claude Code so the new skill is picked up.

If you do not usually use Terminal, ask Codex or Claude Code to install it from this repo:

```text
Install the d-slop skill from https://github.com/daniel-p-green/d-slop
```

If you only want one:

```bash
./scripts/install-skill.sh --target codex
```

```bash
./scripts/install-skill.sh --target claude
```

## For Maintainers

What gets installed:

The installer adds the same skill to Codex and Claude Code:

```text
skill/d-slop/SKILL.md
skill/d-slop/references/style-rules.md
skill/d-slop/examples/rewrite-examples.md
```

The skill includes the main workflow, a longer list of style rules, and a few before/after examples.

To verify the package:

```bash
./scripts/check.sh
```

That check confirms the skill files, installer, public docs, and basic repo hygiene.

## License

MIT
