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
