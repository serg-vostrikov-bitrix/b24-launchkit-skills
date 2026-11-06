---
name: b24-launchkit
description: Use when a Bitrix24 app developer needs release or marketplace documentation, including user manuals, positioning briefs, marketplace descriptions, or improvement of existing app publication text.
---

# B24 App LaunchKit

## Goal

Orchestrate public documentation work for Bitrix24 applications. Help developers and partners turn project evidence, manuals, and old copy into clear user-facing materials for release and marketplace publication.

This is the entry skill for the B24 App LaunchKit group.

## Operating Rule

Do not jump straight to marketplace copy unless the user explicitly asks for that shortened route.

Default to a strict artifact pipeline:

```text
intake -> user manual -> positioning brief -> marketplace description -> reviewer final claim review
```

The orchestrator must make each artifact visible before moving to the next one. Later artifacts must be based on earlier artifacts, not on fresh assumptions.

Do not browse the internet for marketplace rules, examples, or requirements unless the user explicitly asks for current external research. Use the skill instructions and provided project evidence as the source of truth.

Shared writing rules for all artifacts live in `references/writing-style.md`. The producing skills and `b24-reviewer` read that file directly; when you write or revise artifact text yourself, apply it too.

## Intake Gate

Before selecting a route, ask for any missing task controls. Keep the questions compact, but do not skip this gate for project-based work.

Required controls:

- Desired artifact scope: full launch package, manual only, positioning only, marketplace description only, review, or cleanup.
- Output language.
- Source of truth: project path, existing docs/manual, old marketplace text, product notes, or a mix.
- Execution mode override, only if the user does not want the default subagent workflow.
- Whether the user wants the full strict pipeline or an explicitly shortened route.

If the user only says "prepare documentation for this project" or points at a project, assume:

- scope: full launch package;
- route: strict pipeline;
- execution mode: subagents;
- first visible artifact: user manual;
- no internet research.

Still ask for the output language if it is not clear.

## Execution Mode

For the strict pipeline, subagents are the default execution mode. Do not ask the user to choose between current dialog and subagents unless they have indicated a preference for dialog-only execution.

The orchestrator must use the available subagent/delegation tool to launch real subagents for the artifact stages. Do not simulate subagents by writing all artifacts in the current dialog.

If no subagent/delegation tool is available in the environment, stop before artifact production and tell the user that the subagent workflow is blocked. Ask whether to continue in the current dialog as a fallback.

Only use current-dialog execution when one of these is true:

- the user explicitly requests dialog-only execution;
- no subagent/delegation tool exists and the user approves the fallback;
- the requested route is a small single-artifact route such as wording cleanup or final review.

Use sequential stage dependencies:

```text
manual subagent -> positioning subagent -> description subagent -> reviewer subagent
```

The manual stage may use parallel investigation subagents for independent evidence areas such as docs, frontend screens, backend APIs, workers, tests, and configuration. The positioning stage must run as a separate subagent after the manual exists. The description stage must run as a separate subagent after the positioning brief exists.

Use `b24-reviewer` as the final artifact-producing review stage by default. The reviewer subagent must read the manual, positioning brief, and marketplace description for the same language, then write the final review artifact.

Use additional artifact-specific reviewer passes after manual, positioning, or description only when the user asks for strict review mode or when the orchestrator sees a concrete risk that would affect downstream quality.

For each requested language, launch the artifact-producing subagents as distinct tasks:

```text
manual.<lang> -> positioning.<lang> -> description.<lang> -> review.<lang>
```

Do not collapse these artifact-producing stages into one subagent unless the user explicitly requests a shortened route.

Each subagent prompt must include:

- the exact artifact it must produce;
- the output language;
- the exact output file path it must write, including artifact number and language postfix;
- the exact upstream file path it must read, when the stage depends on a previous artifact;
- the source material or upstream artifact it may rely on;
- a ban on unsupported claims;
- a ban on internet research unless the user explicitly requested it;
- a ban on writing unrelated artifact files;
- a requirement that all visible headings, subheadings, and structural labels are written in the requested output language;
- the required output format from the matching `b24-*` skill.

For the description subagent, the prompt must also include:

- artifact type: marketplace description;
- a requirement to use `b24-description`;
- a requirement to write only the marketplace headline, body paragraphs, and FAQ;
- a ban on introduction, source summary, review notes, SEO block, installation guide, support contacts, pricing notes, and second-language output unless explicitly requested;
- a requirement to save only `03-marketplace-description.<lang>.md`.

For the reviewer subagent, the prompt must also include:

- target artifact type: final claim review;
- target artifact path: the marketplace description path;
- the manual path;
- the positioning brief path;
- the marketplace description path;
- the final review output path;
- review profile file: `skills/b24-reviewer/references/final-claim-review.md`;
- a requirement to use `b24-reviewer` with only that profile file;
- a requirement to review only the marketplace description as the target artifact, using the manual and positioning brief only as evidence;
- a requirement to apply finite review and stop after blocking and important issues.

The orchestrator remains responsible for asking the intake questions, choosing the artifact directory, passing exact file paths to subagents, presenting each artifact to the user, and ensuring the reviewer stage runs. After each subagent returns, the orchestrator must read the expected output file and confirm it exists before moving to the next stage.

## Artifact Persistence

For the strict pipeline, persist intermediate artifacts as files when the workspace is writable, unless the user chooses dialog-only execution.

Default directory:

```text
docs/launchkit/
```

If the directory is not obvious or the workspace should not be changed, ask before writing. Do not silently overwrite existing artifacts; update with confirmation or create a new version.

Use one file per artifact and per language. File names must include a language postfix before `.md`:

```text
01-user-manual.<lang>.md
02-positioning-brief.<lang>.md
03-marketplace-description.<lang>.md
04-final-claim-review.<lang>.md
```

Use lowercase BCP 47-style language codes such as `ru`, `en`, `de`, `fr`, `es`, `pt-br`, or `zh-cn`. If the user requests multiple languages, create a complete artifact set for each language instead of mixing languages in one file.

Before launching subagents, compute an artifact path manifest for every requested language:

```text
artifact_dir: docs/launchkit/
language: <lang>
manual: docs/launchkit/01-user-manual.<lang>.md
positioning: docs/launchkit/02-positioning-brief.<lang>.md
description: docs/launchkit/03-marketplace-description.<lang>.md
final_review: docs/launchkit/04-final-claim-review.<lang>.md
```

Pass the relevant manifest entries into each subagent prompt. Subagents must not infer or choose save paths themselves.

Downstream stages must read the saved upstream artifact for the same language before producing the next artifact. For example, `02-positioning-brief.en.md` must be based on `01-user-manual.en.md`.

The reviewer stage must read all same-language upstream artifacts before producing `04-final-claim-review.<lang>.md`.

If the user chooses dialog-only execution, do not write files and explicitly say that artifacts were not saved to disk.

## Route Selection

Choose the route only after the intake gate.

Default route:

```text
Project only:
  use b24-manual -> b24-positioning -> b24-description -> b24-reviewer
```

Shortened routes are allowed only when the user explicitly requests them:

```text

Manual already exists:
  use b24-positioning -> b24-description -> b24-reviewer

Old marketplace text exists:
  use b24-positioning -> b24-description -> b24-reviewer

User asks only for a manual:
  use b24-manual

User asks only to improve wording:
  use b24-description with strict meaning-preservation guardrails

User asks to check truthfulness:
  use b24-reviewer final claim review against provided source material and list unsupported claims
```

If project evidence exists and the user did not ask to skip the manual, `b24-manual` must run first.

## Clarifying Questions

Ask only for missing information that blocks the intake gate or the chosen route. Prefer proceeding after the required controls are known.

Useful questions:

- What artifact do you need: manual, marketplace description, or full launch package?
- What language should the result use?
- I will use subagents for the manual, positioning, and description stages unless you explicitly want dialog-only execution.
- Do you want the full strict pipeline, or are you deliberately asking for a shortened route?
- What is the app name exactly as it should appear publicly?
- Should the text be conservative for moderation or more conversion-focused?
- Which source should be treated as authoritative if project behavior and old copy conflict?

## Skill Contracts

`b24-manual` produces factual documentation. It answers what is confirmed.

`b24-positioning` produces the positioning brief. It answers what should be said and includes `Do Not Claim` guardrails.

`b24-description` produces public text. It answers how to say it clearly and persuasively without changing the meaning.

`b24-reviewer` reviews artifacts with finite, artifact-specific criteria. It answers whether the artifact is good enough to use and what concrete changes, if any, are necessary before stopping.

The orchestrator passes outputs forward and does not let later steps invent facts that earlier steps did not support.

## Final Review

Before returning a final public description, run `b24-reviewer` as a reviewer stage. Check:

- The headline and first paragraph match the positioning brief.
- Key scenarios are represented accurately.
- Requirements and limitations are still visible.
- The text does not contradict `Do Not Claim`.
- The text does not imply unsupported integrations, automation level, data coverage, guarantees, security promises, or business outcomes.
- Technical details appear only when they affect setup, usage, or user expectations.

If the text fails review, revise the marketplace description, then rerun `b24-reviewer` once. Do not output the failed draft as final public copy.

Do not run endless polish loops. After blocking and important reviewer findings are fixed, stop even if optional wording improvements remain possible.

## Output Behavior

When producing an artifact, return the artifact itself first. Add a short note only when the user needs to know about missing source material, unresolved uncertainty, or important assumptions.

For the strict pipeline, stop after each major artifact and make the next step explicit:

1. Return the user manual.
2. Ask for approval or corrections before deriving positioning, unless the user already authorized continuous execution.
3. Return the positioning brief.
4. Ask for approval or corrections before writing public copy, unless the user already authorized continuous execution.
5. Return the marketplace description.
6. Run reviewer final claim review and return the final review notes.

Do not output bilingual artifacts unless the user explicitly asks for multiple languages.

For marketplace descriptions, use the `b24-description` default format:

```text
Headline: <short useful headline with app name>

<2-4 short paragraphs>

FAQ
<question>
<answer>
```

For manuals and positioning briefs, preserve the structured headings from the producing skill.

All visible headings, subheadings, and labels inside artifacts must be in the requested output language. English headings in skill templates are semantic placeholders and must be translated.
