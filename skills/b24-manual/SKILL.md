---
name: b24-manual
description: Use when user needs to build a user-facing manual for a Bitrix24 application from a project, docs, old copy, UI routes, APIs, jobs, tests, or other implementation evidence before preparing release or marketplace materials.
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

Use this structure by default. Merge sections for small apps. Translate all headings and subheadings into the requested output language; the English headings below are semantic placeholders, not literal text to copy.

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

- Apply the shared writing rules in `../b24-launchkit/references/writing-style.md`.
- Write in the user's language. If language of source materials is mixed, use English unless the user asks otherwise.
- Write every visible structural label in the same language as the artifact: document title, headings, subheadings, table headers, scenario labels, status labels, and note labels.
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
