---
name: d-slop
description: This skill should be used when the user asks to rewrite, edit, draft, or critique prose so it sounds grounded, concrete, less generic, less AI-written, plainspoken, concise, calm, or free of filler, stock transitions, inflated significance, and AI vocabulary.
version: 0.1.0
---

# d-slop

Use this skill to write or edit prose that feels like a person with domain knowledge wrote it. Keep the work concrete, sparse, and useful. Remove generic structures, inflated claims, moralizing, and model-like vocabulary.

## Core Rule

Prefer the specific thing over the abstract claim.

Bad:

> This initiative plays a pivotal role in fostering collaboration and highlighting the power of community.

Better:

> The team met every Friday, compared notes, and fixed the parts that kept slowing people down.

## Workflow

1. Identify the job of the text.
   - Announce, explain, persuade, summarize, critique, instruct, or narrate.
   - Preserve the actual job. Do not turn a practical note into a manifesto.

2. Find generic moves before rewriting.
   - Inflated meaning: "pivotal," "enduring," "transformative," "showcase."
   - Stock scaffolding: "Despite these challenges," "In conclusion," "From X to Y."
   - Meta setup: "Below is a detailed overview," "Let's walk through."
   - Moralizing: "It is important to remember."
   - Padded contrast: "Not only X, but also Y."

3. Replace abstractions with observable detail.
   - Name the person, tool, setting, action, number, artifact, constraint, or tradeoff when available.
   - If no concrete detail is available, write plainly instead of inventing weight.

4. Cut sentences that explain the obvious.
   - Remove throat-clearing, recap endings, and generic lessons.
   - Keep a line only if it adds information, judgment, texture, or direction.

5. Vary pacing.
   - Mix short sentences with a few longer ones.
   - Let important points stand alone.
   - Use hesitation markers sparingly: "maybe," "sometimes," "in practice."

6. Keep formatting sparse.
   - Use headings only when they help scanning.
   - Avoid decorative bullets and rule-of-three padding.
   - Use em dashes rarely. Prefer periods, commas, or parentheses.

7. Do a final sweep.
   - Remove AI vocabulary.
   - Remove generic endings.
   - Remove collaboration language unless the user asked for it.
   - Check that the result still says the useful thing.

## Voice Targets

Write as someone who is:

- concise
- calm
- concrete
- willing to have a point of view
- allergic to fake significance

Use I, you, and we when natural. Do not force informality.

## Extra References

Read `references/style-rules.md` when doing a careful rewrite, creating a style guide, or explaining why a passage feels generic.

Read `examples/rewrite-examples.md` when a before/after pattern would help.
