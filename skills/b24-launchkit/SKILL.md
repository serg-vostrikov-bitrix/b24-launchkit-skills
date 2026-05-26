---
name: b24-launchkit
description: Use when a Bitrix24 app developer needs release or marketplace documentation, including user manuals, positioning briefs, marketplace descriptions, FAQ, short public descriptions, or improvement of existing app publication text.
---

# B24 App LaunchKit

## Goal

Orchestrate public documentation work for Bitrix24 applications. Help developers and partners turn project evidence, manuals, and old copy into clear user-facing materials for release and marketplace publication.

This is the entry skill for the B24 App LaunchKit group.

## Route Selection

Choose the smallest route that satisfies the user's request:

```text
Project only:
  use b24-manual -> b24-positioning -> b24-description -> final review

Manual already exists:
  use b24-positioning -> b24-description -> final review

Old marketplace text exists:
  use b24-positioning -> b24-description -> final review

User asks only for a manual:
  use b24-manual

User asks only to improve wording:
  use b24-description with strict meaning-preservation guardrails

User asks to check truthfulness:
  perform final review against provided source material and list unsupported claims
```

## Clarifying Questions

Ask only for missing information that blocks the chosen route. Prefer proceeding when source materials are available.

Useful questions:

- What artifact do you need: manual, marketplace description, FAQ, short description, or full launch package?
- What language should the result use?
- What is the app name exactly as it should appear publicly?
- Should the text be conservative for moderation or more conversion-focused?
- Which source should be treated as authoritative if project behavior and old copy conflict?

## Skill Contracts

`b24-manual` produces factual documentation. It answers what is confirmed.

`b24-positioning` produces the positioning brief. It answers what should be said and includes `Do Not Claim` guardrails.

`b24-description` produces public text. It answers how to say it clearly and persuasively without changing the meaning.

The orchestrator passes outputs forward and does not let later steps invent facts that earlier steps did not support.

## Final Review

Before returning a final public description, check:

- The headline and first paragraph match the positioning brief.
- Key scenarios are represented accurately.
- Requirements and limitations are still visible.
- The text does not contradict `Do Not Claim`.
- The text does not imply unsupported integrations, automation level, data coverage, guarantees, security promises, or business outcomes.
- Technical details appear only when they affect setup, usage, or user expectations.

If the text fails review, revise it before answering. Do not output the failed draft.

## Output Behavior

When producing an artifact, return the artifact itself first. Add a short note only when the user needs to know about missing source material, unresolved uncertainty, or important assumptions.

For marketplace descriptions, use the `b24-description` default format:

```text
Headline: <short useful headline with app name>

<2-4 short paragraphs>

FAQ
<question>
<answer>
```

For manuals and positioning briefs, preserve the structured headings from the producing skill.
