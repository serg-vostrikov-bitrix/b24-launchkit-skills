---
name: b24-positioning
description: Use when user needs to turn a Bitrix24 app manual, old marketplace text, or product notes into a positioning brief with target audience, user problem, business value, key scenarios, limits, do-not-claim guardrails, and search or FAQ intents.
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
2. Identify the primary audience: business type or company context when supported by the facts, plus primary and secondary human roles.
3. State the main user problem in business language.
4. Select the key scenarios that best explain the product's value.
5. Extract direct business benefits from confirmed behavior.
6. List important product objects, Bitrix24 entities, external systems, and data flows only when confirmed.
7. Preserve requirements and limitations that matter before installation or use.
8. Write explicit `Do Not Claim` guardrails.
9. Recommend the strongest safe presentation angle.
10. Draft search and FAQ intents that match real capabilities.

## Output Format

Return only the brief. Translate all headings and subheadings into the requested output language; the English headings below are semantic placeholders, not literal text to copy.

```markdown
# Positioning Brief

## Target Audience
<Companies, teams, or business contexts that can recognize themselves in the marketplace description, plus primary and secondary human roles. If company traits cannot be inferred safely, say so briefly and focus on roles.>

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
- Treat Bitrix24 apps as B2B products: first try to identify what type of company, department, workflow scale, sales/service model, operational process, or business situation would recognize itself in the app's value.
- Do not reduce target audience to job roles when the product facts imply a business context, for example companies with repeat client requests, distributed sales teams, field service workflows, document-heavy approvals, multichannel customer communication, or recurring data exchange.
- Only infer company characteristics from confirmed functionality, entities, integrations, workflows, or stated use cases. If the source does not support a business segment, avoid naming one.
- You may infer direct business consequences from confirmed behavior: less manual work, fewer duplicate entries, clearer control, faster response, or cleaner data.
- If evidence is weak, either omit the claim or put it in `Do Not Claim`.
- Keep the brief strategic and structured. Do not write final marketplace copy here.
- Apply the shared writing rules in `../b24-launchkit/references/writing-style.md`.
- Use the user's requested language. If not specified, follow the source language, with English as fallback for mixed materials.
- Write every visible structural label in the same language as the artifact: title, headings, subheadings, list labels, search-intent labels, FAQ labels, and guardrail labels.
