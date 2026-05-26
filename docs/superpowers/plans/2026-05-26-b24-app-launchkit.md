# B24 App LaunchKit Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create the MVP skill set for B24 App LaunchKit: `b24-launchkit`, `b24-manual`, `b24-positioning`, and `b24-description`.

**Architecture:** The LaunchKit is a small skill pipeline. `b24-manual` extracts confirmed user-facing facts, `b24-positioning` turns those facts into a structured positioning brief, `b24-description` writes publication-ready text from that brief, and `b24-launchkit` orchestrates the route and performs final claim review.

**Tech Stack:** Canonical Codex skill sources stored in this repository under `skills/`, Markdown `SKILL.md` files with YAML frontmatter, local install links or copies into `~/.codex/skills` for real Codex discovery, existing source skills `user-manual-from-project` and `marketplace-card-optimizer`.

---

## File Structure

Create and maintain these new skill folders in the repository:

```text
skills/b24-launchkit/SKILL.md
skills/b24-manual/SKILL.md
skills/b24-positioning/SKILL.md
skills/b24-description/SKILL.md
```

Use these existing skills as source material:

```text
~/.codex/skills/user-manual-from-project/SKILL.md
~/.codex/skills/marketplace-card-optimizer/SKILL.md
```

Do not modify the existing source skills in this MVP. They stay available as rollback/reference points.

`~/.codex/skills` is a generated local install target, not the source of truth. Do not edit LaunchKit files there by hand. Use `scripts/install-local-skills.sh` to link or copy the repository versions into Codex for manual testing.

Use `rtk` command prefixes when available in the environment. If `rtk` is not installed or not in `PATH`, run the same command without the prefix.

## Task 0: Repository-First Skill Installation

**Files:**
- Create: `scripts/install-local-skills.sh`
- Create: `scripts/validate-skills.sh`
- Create: `.gitignore`

- [x] **Step 1: Keep skill sources inside the repository**

Expected structure:

```text
skills/b24-launchkit/SKILL.md
skills/b24-manual/SKILL.md
skills/b24-positioning/SKILL.md
skills/b24-description/SKILL.md
```

- [x] **Step 2: Add local installer**

Run:

```bash
scripts/install-local-skills.sh
```

Expected: each `skills/b24-*` folder is linked into `~/.codex/skills/b24-*`. If symlinks do not work in a target Codex environment, run `scripts/install-local-skills.sh copy`.

- [x] **Step 3: Add validator wrapper**

Run:

```bash
scripts/validate-skills.sh
```

Expected: all four repository skill folders pass `quick_validate.py`, and no draft markers remain.

Implementation note: the wrapper uses `scripts/quick-validate-skill.py`, a dependency-free local equivalent for the simple frontmatter used in this project. This avoids requiring PyYAML in the active Python environment.

## Task 1: Create `b24-manual`

**Files:**
- Create: `skills/b24-manual/SKILL.md`
- Read: `~/.codex/skills/user-manual-from-project/SKILL.md`
- Read: `/Users/sv/github-serg-vostrikov-bitrix/monday-1/docs/superpowers/specs/2026-05-26-b24-app-launchkit-design.md`

- [x] **Step 1: Create the skill folder**

Run:

```bash
rtk mkdir -p skills/b24-manual
```

Expected: command exits successfully and the folder exists.

- [x] **Step 2: Write `b24-manual/SKILL.md`**

Create `skills/b24-manual/SKILL.md` with this content:

````markdown
---
name: b24-manual
description: Use when Codex needs to build a user-facing manual for a Bitrix24 application from a project, docs, old copy, UI routes, APIs, jobs, tests, or other implementation evidence before preparing release or marketplace materials.
---

# B24 Manual

## Goal

Produce a factual user-facing manual for a Bitrix24 application. The manual should explain what the app does, who it is for, which scenarios it supports, what users receive as a result, and which limitations affect installation or use.

This skill is the factual base for B24 App LaunchKit. Do not write marketplace copy here. Do not make the app sound more complete, automated, secure, or integrated than the evidence supports.

## Workflow

1. Find source material:
   - Read `README*`, `docs/README*`, user guides, SRS/HLD/LLD docs, marketplace drafts, setup notes, and support docs.
   - Inspect implementation evidence that affects users: frontend routes/pages/components, backend controllers/routes/API contracts, workers/jobs, database entities, tests, fixtures, and config.
   - Prefer `rg --files` and targeted `rg` searches over broad file dumps.
2. Build an internal evidence map:
   - Identify product purpose, target users, external systems, major objects, main workflows, outputs, permissions, errors, and important limits.
   - Separate user-facing behavior from internal infrastructure.
   - Do not expose source file names, confidence labels, or implementation notes in the final manual.
3. Classify scenarios:
   - Key scenarios deliver the app's main value.
   - Additional scenarios cover setup, monitoring, recovery, reports, settings, errors, and support cases.
4. Write the public manual:
   - Use product and user language.
   - Include only supported claims.
   - Explain limitations plainly when they affect user expectations.
5. Check the manual:
   - Remove implementation leakage.
   - Remove speculative claims.
   - Confirm the manual answers what the app does, for whom, how users use it, what result they get, and what limits matter.

## Recommended Output

Use this structure by default. Merge sections for small apps.

```markdown
# User Manual

## What The App Does
## Who It Is For
## Main User Value
## Key Scenarios
## Additional And Error Scenarios
## Implemented Functionality
## Result Of The App
## Unsupported Features
## Limits And Rules
## Screens And States
## Final User Outcome
```

## Style Rules

- Write in the user's language. If source materials are Russian or mixed Russian/English, use Russian unless the user asks otherwise.
- Be concrete. Prefer "downloads an error report" over "provides observability".
- Use short paragraphs, tables, and numbered scenario steps when useful.
- Avoid class names, endpoint names, queue names, database names, and source paths unless they are visible to users.
- Do not include analysis notes, source lists, confidence labels, or audit commentary.
- Do not overpromise. If docs and code conflict, prefer implemented user-visible behavior or omit the disputed claim.

## Useful Search Targets

```bash
rg --files -g 'README*' -g 'docs/**' -g '*GUIDE*' -g '*SRS*' -g '*HLD*' -g '*LLD*'
rg -n "route|router|controller|endpoint|api|page|screen|component|worker|job|command|report|export|import|status|state|permission|role|error|failed|paused|completed"
rg -n "user|admin|operator|support|scenario|flow|install|setup|start|pause|resume|download|upload|migrate|sync|report"
```
````

- [x] **Step 3: Verify frontmatter and required sections**

Run:

```bash
rtk sed -n '1,220p' skills/b24-manual/SKILL.md
```

Expected: output begins with YAML frontmatter containing `name: b24-manual` and `description:`, and includes `Goal`, `Workflow`, `Recommended Output`, `Style Rules`, and `Useful Search Targets`.

- [ ] **Step 4: Commit the plan repository state if this task also updated tracked planning docs**

If the plan file is modified during execution, run from `/Users/sv/github-serg-vostrikov-bitrix/monday-1`:

```bash
rtk git add docs/superpowers/plans/2026-05-26-b24-app-launchkit.md
rtk git commit -m "docs: plan B24 App LaunchKit skills"
```

Expected: commit succeeds or Git reports there is nothing new to commit.

## Task 2: Create `b24-positioning`

**Files:**
- Create: `skills/b24-positioning/SKILL.md`
- Read: `/Users/sv/github-serg-vostrikov-bitrix/monday-1/docs/superpowers/specs/2026-05-26-b24-app-launchkit-design.md`

- [x] **Step 1: Create the skill folder**

Run:

```bash
rtk mkdir -p skills/b24-positioning
```

Expected: command exits successfully and the folder exists.

- [x] **Step 2: Write `b24-positioning/SKILL.md`**

Create `skills/b24-positioning/SKILL.md` with this content:

````markdown
---
name: b24-positioning
description: Use when Codex needs to turn a Bitrix24 app manual, old marketplace text, or product notes into a positioning brief with target audience, user problem, business value, key scenarios, limits, do-not-claim guardrails, and search or FAQ intents.
---

# B24 Positioning

## Goal

Create a positioning brief for a Bitrix24 application. This skill decides what should be said before any marketplace or public description is written.

Use it between factual documentation and public copy. It owns product interpretation: audience, problem, value, scenarios, requirements, limits, and safe claims.

## Inputs

Use any provided source material:

- user manual from `b24-manual`;
- old marketplace description;
- partner notes;
- README or product documentation;
- user-provided facts.

Do not inspect project code unless the user explicitly asks for a positioning brief directly from a project and no manual exists. In that case, prefer using `b24-manual` first.

## Workflow

1. Read the manual and old copy.
2. Identify the primary user and secondary users.
3. State the main user problem in business language.
4. Select the key scenarios that best explain the product's value.
5. Extract direct business benefits from confirmed behavior.
6. List important product objects, Bitrix24 entities, external systems, and data flows only when confirmed.
7. Preserve requirements and limitations that matter before installation or use.
8. Write explicit `Do Not Claim` guardrails.
9. Recommend the strongest safe presentation angle.
10. Draft search and FAQ intents that match real capabilities.

## Output Format

Return only the brief.

```markdown
# Positioning Brief

## Target Audience
<Primary and secondary users in human role language.>

## Primary User Problem
<The main problem the app solves, without technical implementation noise.>

## Main Value Proposition
<One compact paragraph explaining practical value and expected result.>

## Key Scenarios To Emphasize
- <Scenario 1>
- <Scenario 2>
- <Scenario 3>

## Business Benefits
- <Direct benefit supported by the facts>
- <Direct benefit supported by the facts>

## Product Objects And Systems
- <Bitrix24 entities, external systems, files, records, reports, or data objects confirmed by the source>

## Important Requirements And Limits
- <Requirement or limitation that affects setup, usage, expectations, or purchase decision>

## Do Not Claim
- <Unsupported feature, guarantee, integration, automation level, or result that later text must not imply>

## Recommended Presentation Angle
<How to frame the app in public text: the user's job, transition, risk reduction, control, or business outcome.>

## Search And FAQ Intents
- Primary: <main search intent>
- Secondary: <nearby supported intent>
- FAQ: <practical doubt or question the user will likely have>
```

## Rules

- Do not invent features, integrations, supported entities, formats, screens, metrics, triggers, or guarantees.
- You may infer direct business consequences from confirmed behavior: less manual work, fewer duplicate entries, clearer control, faster response, or cleaner data.
- If evidence is weak, either omit the claim or put it in `Do Not Claim`.
- Keep the brief strategic and structured. Do not write final marketplace copy here.
- Use the user's requested language. If not specified, follow the source language, with Russian as fallback for mixed Russian/English materials.
````

- [x] **Step 3: Verify frontmatter and positioning contract**

Run:

```bash
rtk rg -n "name: b24-positioning|Do Not Claim|Recommended Presentation Angle|Search And FAQ Intents" skills/b24-positioning/SKILL.md
```

Expected: all four patterns are found.

## Task 3: Create `b24-description`

**Files:**
- Create: `skills/b24-description/SKILL.md`
- Read: `~/.codex/skills/marketplace-card-optimizer/SKILL.md`
- Read: `/Users/sv/github-serg-vostrikov-bitrix/monday-1/docs/superpowers/specs/2026-05-26-b24-app-launchkit-design.md`

- [x] **Step 1: Create the skill folder**

Run:

```bash
rtk mkdir -p skills/b24-description
```

Expected: command exits successfully and the folder exists.

- [x] **Step 2: Write `b24-description/SKILL.md`**

Create `skills/b24-description/SKILL.md` with this content:

````markdown
---
name: b24-description
description: Use when Codex needs to write or improve public text for a Bitrix24 app from an existing positioning brief, especially marketplace headline, body description, FAQ, short description, or style cleanup without changing product meaning.
---

# B24 Description

## Goal

Write clear, publication-ready public text for a Bitrix24 application from a positioning brief.

This skill owns wording, structure, tone, headline quality, FAQ phrasing, and readability. It does not own product strategy. It must not rediscover the target audience, key scenarios, or value proposition if a positioning brief is available.

## Inputs

Prefer a `b24-positioning` brief with:

- target audience;
- primary user problem;
- main value proposition;
- key scenarios;
- business benefits;
- product objects and systems;
- requirements and limits;
- `Do Not Claim` guardrails;
- search and FAQ intents.

If the user provides only old text and asks for style cleanup, preserve the existing meaning and do not add new capabilities.

## Workflow

1. Read the positioning brief.
2. Identify the app name, output language, required artifact, and marketplace context.
3. Draft a short useful headline that includes the app name.
4. Write two to four coherent paragraphs:
   - first paragraph: who the app is for, what problem it solves, and what practical result it gives;
   - second paragraph: supported objects, processes, data, or systems;
   - third paragraph: control, status, errors, reports, or result confirmation when supported;
   - fourth paragraph: requirements and limits as usage boundaries when important.
5. Write three to five practical FAQ items from the user's likely doubts.
6. Compare the result against `Do Not Claim` and remove any unsupported implication.

## Default Output Format

```text
Headline: <short useful headline with app name>

<2-4 short paragraphs of public description text. Do not use internal headings or bullet lists in the main description.>

FAQ
<Question 1?>
<Short answer 1>
<Question 2?>
<Short answer 2>
<Question 3?>
<Short answer 3>
```

## Style Rules

- Write a little more persuasively than a dry manual, but avoid advertising exaggeration.
- Start with user intent and business value, not APIs, fields, triggers, endpoints, or internal mechanics.
- Use positive framing for limitations: describe fit and usage boundaries instead of leading with refusals.
- Do not use claims such as "instant", "perfect", "fully automatic", "without errors", or "solves forever" unless directly supported.
- Do not add links, contacts, changelog, source references, cross-promo, or editorial explanations unless the user asks.
- Do not use SEO spam or repeated keyword chains.
- Keep FAQ answers short and practical.
- Use "Битрикс24" in Russian text. Use the natural brand spelling for the chosen output language.

## Safety Rules

- Do not invent functions, integrations, supported formats, entities, metrics, screens, triggers, automations, guarantees, or results.
- Do not weaken or hide important requirements and limitations from the positioning brief.
- Do not mention routine technical security measures unless they affect user setup, decisions, or expectations.
- If the brief lacks support for a paragraph, omit that paragraph instead of filling it with generic claims.
````

- [x] **Step 3: Verify description stays downstream of positioning**

Run:

```bash
rtk rg -n "positioning brief|Do Not Claim|does not own product strategy|Do not invent" skills/b24-description/SKILL.md
```

Expected: all four patterns are found.

## Task 4: Create `b24-launchkit`

**Files:**
- Create: `skills/b24-launchkit/SKILL.md`
- Read: `/Users/sv/github-serg-vostrikov-bitrix/monday-1/docs/superpowers/specs/2026-05-26-b24-app-launchkit-design.md`

- [x] **Step 1: Create the skill folder**

Run:

```bash
rtk mkdir -p skills/b24-launchkit
```

Expected: command exits successfully and the folder exists.

- [x] **Step 2: Write `b24-launchkit/SKILL.md`**

Create `skills/b24-launchkit/SKILL.md` with this content:

````markdown
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
````

- [x] **Step 3: Verify orchestration routes**

Run:

```bash
rtk rg -n "Project only|Manual already exists|Old marketplace text exists|Final Review|Do Not Claim" skills/b24-launchkit/SKILL.md
```

Expected: all five patterns are found.

## Task 5: Validate the Skill Set

**Files:**
- Read: `skills/b24-launchkit/SKILL.md`
- Read: `skills/b24-manual/SKILL.md`
- Read: `skills/b24-positioning/SKILL.md`
- Read: `skills/b24-description/SKILL.md`

- [x] **Step 1: Check all skill files exist**

Run:

```bash
rtk find skills -maxdepth 2 -path '*/b24-*' -o -path '*/b24-*/SKILL.md'
```

Expected: output includes these four files:

```text
skills/b24-launchkit/SKILL.md
skills/b24-manual/SKILL.md
skills/b24-positioning/SKILL.md
skills/b24-description/SKILL.md
```

- [x] **Step 2: Check frontmatter names**

Run:

```bash
rtk rg -n "^name: b24-(launchkit|manual|positioning|description)$" skills/b24-*/SKILL.md
```

Expected: exactly four matches.

- [x] **Step 3: Check no unresolved draft markers**

Run:

```bash
rtk rg -n "TO.DO|TB.D|FIX.ME|place.holder|fill.in|implement.la.er" skills/b24-*/SKILL.md
```

Expected: no matches.

- [ ] **Step 4: Run a manual smoke test on this repository**

Use the new skills conceptually on `/Users/sv/github-serg-vostrikov-bitrix/monday-1`:

1. Ask for a marketplace description route through `b24-launchkit`.
2. Confirm it chooses `b24-manual -> b24-positioning -> b24-description -> final review`.
3. Confirm `b24-positioning` produces a `Do Not Claim` section.
4. Confirm final description does not mention features absent from the manual or positioning brief.

Expected: the output separates factual manual, positioning brief, and final marketplace wording. If the active Codex session has not reloaded the new skills, run the smoke test in a new session after skill discovery refreshes.

## Task 6: Optional Cleanup After MVP Works

**Files:**
- Read: `~/.codex/skills/marketplace-card-optimizer/SKILL.md`
- Read: `~/.codex/skills/user-manual-from-project/SKILL.md`

- [ ] **Step 1: Decide whether old skills remain standalone**

If the new LaunchKit works on a real app, keep the old skills unchanged unless the user explicitly wants migration.

Expected decision:

```text
Keep user-manual-from-project as a general, non-B24 manual skill.
Keep marketplace-card-optimizer as a legacy single-prompt fallback until B24 App LaunchKit proves stable.
```

- [ ] **Step 2: Add deprecation notes only if requested**

Do not add deprecation notes by default. If requested later, add a short pointer from `marketplace-card-optimizer` to `b24-launchkit` for Bitrix24 app publication workflows.

Expected: no automatic changes in this MVP.

## Self-Review

- Spec coverage: the plan creates all four MVP skills, preserves the manual -> positioning -> description -> final review pipeline, defers `b24-claim-check`, and includes validation on a real Bitrix24 app project.
- Draft-marker scan: the plan contains no unresolved draft instructions; all file contents and verification commands are explicit.
- Type and name consistency: skill names match the design document exactly: `b24-launchkit`, `b24-manual`, `b24-positioning`, `b24-description`.
