---
name: b24-description
description: Use when user needs to write or improve a Bitrix24 Marketplace description with headline, body copy, and FAQ from an existing positioning brief without changing product meaning.
---

# B24 Description

## Goal

Write clear, publication-ready Bitrix24 Marketplace description text for a Bitrix24 application from a positioning brief.

This skill owns marketplace description wording, structure, tone, headline quality, FAQ phrasing, and readability. It does not own product strategy. It must not rediscover the target audience, key scenarios, or value proposition if a positioning brief is available.

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
3. Draft a short useful marketplace headline that includes the app name, target scenario, and practical outcome.
4. Write two to four coherent paragraphs:
   - first paragraph: who the app is for, what manual or risky alternative it replaces, and what practical result it gives;
   - second paragraph: supported objects, processes, data, or systems, grouped by user meaning rather than dumped as a raw list;
   - third paragraph: control, status, errors, reports, or result confirmation when supported, framed as confidence for the administrator or buyer;
   - fourth paragraph: requirements and limits as usage boundaries when important.
5. Write three to five practical FAQ items from the user's likely doubts.
6. Compare the result against `Do Not Claim` and remove any unsupported implication.

## Marketplace Description Output

Translate all visible labels into the requested output language. The English labels below are semantic placeholders, not literal text to copy.

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

Output only this marketplace description artifact. Do not add an introduction, rationale, source summary, review notes, SEO keyword block, installation guide, support contacts, pricing notes, or any second-language version unless the user explicitly requested that separate artifact.

## Style Rules

- Write a little more persuasively than a dry manual, but avoid advertising exaggeration.
- Write every visible structural label in the same language as the artifact: headline label, FAQ label, and question labels if used.
- Start with user intent and business value, not APIs, fields, triggers, endpoints, or internal mechanics.
- Make the value proposition specific: name the target user, the job they need done, and the outcome they get.
- Position the app against the real alternative the buyer is trying to avoid: manual work, spreadsheet cleanup, custom development, duplicated data entry, unclear status, or lost context. Do this only when supported by the brief.
- Write from the customer's point of view. Prefer "the administrator gets control", "the team can continue work", "data remains available" over "the app implements", "the module processes", or "we provide".
- Convert feature lists into feature-to-benefit sentences. Explain why each important capability matters for the user, especially control, reports, mapping, and error handling.
- Show the after-state early: what will appear in Bitrix24, what the user can verify, and how work continues after setup or migration.
- Keep the tone like confident B2B product marketing: concrete, calm, useful, and slightly sales-oriented. Avoid hype, cute slogans, generic adjectives, and empty claims such as "powerful", "innovative", "seamless", "robust", or "unique" unless immediately made specific.
- Front-load the strongest practical reason to install. Put secondary implementation details later or in FAQ.
- Keep sentences scannable. Break up long entity lists into meaning-based groups, and avoid one paragraph becoming a schema dump.
- Use positive framing for limitations: describe fit and usage boundaries instead of leading with refusals.
- Do not use claims such as "instant", "perfect", "fully automatic", "without errors", or "solves forever" unless directly supported.
- Do not add links, contacts, changelog, source references, cross-promo, or editorial explanations unless the user asks.
- Do not produce bilingual or multilingual output unless the user explicitly requests multiple languages. If one language is requested, every visible label and paragraph must use only that language, except product names and source system names.
- Do not use SEO spam or repeated keyword chains.
- Keep FAQ answers short and practical.
- Use "Bitrix24" the natural "Bitrix24" brand spelling for the chosen output language.

## Safety Rules

- Do not invent functions, integrations, supported formats, entities, metrics, screens, triggers, automations, guarantees, or results.
- Do not weaken or hide important requirements and limitations from the positioning brief.
- Do not mention routine technical security measures unless they affect user setup, decisions, or expectations.
- If the brief lacks support for a paragraph, omit that paragraph instead of filling it with generic claims.
- Use the user's requested language. If not specified, follow the source language, with English as fallback for mixed materials.
