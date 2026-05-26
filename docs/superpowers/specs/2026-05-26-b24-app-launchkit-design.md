# B24 App LaunchKit Design

## Purpose

B24 App LaunchKit is a set of Codex skills for Bitrix24 application developers who need to prepare public product documentation before release or marketplace publication.

The system is not only a marketplace card generator. It should help produce documentation artifacts that explain what an app does, who it is for, why it is useful, how users work with it, and which limitations matter before installation.

The first working version focuses on the most valuable path:

```text
source material
  -> b24-manual
  -> b24-positioning
  -> b24-description
  -> b24-launchkit final review
```

Source material can be a project repository, existing documentation, a manual draft, product notes, or an old marketplace description.

## Primary User

The primary user is a Bitrix24 app developer or partner who already has an application, source project, manual draft, or old marketplace text. They want to quickly receive clear publication-ready materials without manually turning technical implementation details into user-facing documentation.

The first-version success bar: the user can point Codex at a real app project or existing source materials and receive a coherent marketplace description that is grounded in the app's real behavior.

## Skill Structure

```text
b24-launchkit/        # orchestrator
b24-manual/           # factual user manual from project evidence
b24-positioning/      # product meaning, audience, value, scenarios
b24-description/      # public text: headline, description, FAQ
```

`b24-claim-check` is intentionally deferred as a separate skill. In the MVP, claim checking is an explicit final review step inside `b24-launchkit`, so the first version still protects against unsupported claims.

## Responsibility Boundaries

### b24-manual

`b24-manual` answers: what is confirmed?

It inspects source materials and writes a user-facing manual. It should identify what the app does, who uses it, which workflows exist, what result users receive, which screens or states matter, and which limitations shape expectations.

It must avoid marketplace-style selling. Its output should be factual, concrete, and useful as source material for later roles.

### b24-positioning

`b24-positioning` answers: what should we say?

It receives a manual, existing description, or both, and produces a positioning brief. It should extract the target audience, primary user problem, business value, key scenarios, important limits, supported and unsupported claims, and the recommended angle for public presentation.

This skill owns product interpretation. `b24-description` should not rediscover the audience or key scenarios on its own.

### b24-description

`b24-description` answers: how should we say it?

It receives a positioning brief and writes publication text. For the MVP, the default target is a Bitrix24 Marketplace description: headline, two to four body paragraphs, and FAQ.

It may improve style, clarity, rhythm, headings, and positive framing, but it must not add new product claims, scenarios, integrations, guarantees, or unsupported business outcomes.

### b24-launchkit

`b24-launchkit` answers: which route does this user need?

It is the orchestrator. It clarifies the requested artifact, selects the needed skills, passes outputs between them, and performs the final consistency review.

It should support at least these routes:

```text
Project only:
  b24-manual -> b24-positioning -> b24-description -> final review

Manual already exists:
  b24-positioning -> b24-description -> final review

Old marketplace text exists:
  b24-positioning -> b24-description -> final review

User asks only for a manual:
  b24-manual

User asks only to improve wording:
  b24-description with strict meaning-preservation guardrails
```

## Intermediate Artifacts

### Manual Output

`b24-manual` should produce a compact but complete manual with these sections when applicable:

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

Sections may be merged for small apps.

### Positioning Brief Output

`b24-positioning` should produce this structured brief:

```markdown
# Positioning Brief

## Target Audience
## Primary User Problem
## Main Value Proposition
## Key Scenarios To Emphasize
## Business Benefits
## Product Objects And Systems
## Important Requirements And Limits
## Do Not Claim
## Recommended Presentation Angle
## Search And FAQ Intents
```

The `Do Not Claim` section is required. It is the main guardrail between product strategy and marketing text.

### Description Output

`b24-description` should produce:

```text
Headline: <short useful headline with app name>

<2-4 coherent paragraphs>

FAQ
<question 1>
<short answer 1>
<question 2>
<short answer 2>
<question 3>
<short answer 3>
```

The default language should follow the user's request. If not specified, it should follow the source material language, with Russian as the fallback for mixed Russian/English materials.

## MVP Scope

In scope:

- Create four skills: `b24-launchkit`, `b24-manual`, `b24-positioning`, `b24-description`.
- Base `b24-manual` on the existing `user-manual-from-project` skill.
- Base `b24-description` on the current marketplace description prompt, but remove product strategy responsibilities from it.
- Add a clear positioning brief contract between factual documentation and marketing text.
- Include final claim review in `b24-launchkit`.
- Optimize for Bitrix24 Marketplace descriptions as the first public artifact.

Out of scope for MVP:

- Separate `b24-claim-check` skill.
- Automated scoring of marketplace quality.
- Multiple marketplace formats beyond the Bitrix24 Marketplace card.
- Localization workflow across multiple languages in one run.
- UI, CLI, or scripts for running the pipeline.
- Persistent artifact storage or template management.

## Quality Rules

The LaunchKit must preserve a strict difference between fact, positioning, and style:

- Facts come from project evidence, user-provided manuals, or old copy.
- Positioning may infer direct business consequences from confirmed behavior.
- Description may improve wording and emphasis but cannot invent capabilities.
- Important limitations must remain visible and should be framed as usage boundaries, not hidden disclaimers.
- Technical details should appear only when they affect user decisions, setup, or expectations.

## Verification Plan

Use one real Bitrix24 app project as a test case.

1. Run the new path from project evidence to manual.
2. Produce a positioning brief from the manual.
3. Produce a marketplace description from the brief.
4. Compare the result with the current `marketplace-card-optimizer` output.
5. Check that the final text is clearer, more structured, and less likely to invent unsupported claims.

The MVP is successful if a developer can review the final description and say:

- the app's purpose is clear;
- the target user and value are clear;
- key scenarios are represented accurately;
- important limits are not lost;
- the text feels suitable for marketplace publication.
