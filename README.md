# B24 LaunchKit Skills

Agent skills for preparing release and marketplace documentation for Bitrix24 applications.

The project is designed as a small documentation pipeline: start from project evidence, existing docs, or old marketplace copy; produce a factual user manual; turn it into a positioning brief; write public marketplace-ready text; then review the result with finite, artifact-specific criteria.

The orchestrator is intentionally strict: it asks for task settings first, then produces each artifact in order. It does not skip straight to marketplace copy or generate multiple languages unless asked.

## Skills

- `b24-launchkit` - orchestrates the full workflow and routes final review.
- `b24-manual` - extracts confirmed user-facing facts from project evidence and writes a factual manual.
- `b24-positioning` - turns the manual or old copy into a positioning brief with audience, value, limits, and `Do Not Claim` guardrails.
- `b24-description` - writes public text such as a marketplace headline, description, and FAQ without inventing unsupported capabilities.
- `b24-reviewer` - reviews manuals, positioning briefs, marketplace descriptions, and final public text with finite artifact-specific criteria.

## Workflow

```text
intake
  -> source material
  -> factual manual
  -> positioning brief
  -> marketplace description
  -> reviewer final claim review
```

Source material can be a project repository, existing documentation, a user manual draft, product notes, or an old marketplace description.

Default route:

- Project only: `b24-manual -> b24-positioning -> b24-description -> b24-reviewer`

Shortened routes are supported only when requested:

- Existing manual: `b24-positioning -> b24-description -> b24-reviewer`
- Existing marketplace text: `b24-positioning -> b24-description -> b24-reviewer`
- Manual only: `b24-manual`
- Wording cleanup only: `b24-description` with strict meaning-preservation rules

## Artifact Files

For the strict pipeline, intermediate artifacts are saved under `docs/launchkit/` when the workspace is writable. File names include a language postfix:

```text
01-user-manual.<lang>.md
02-positioning-brief.<lang>.md
03-marketplace-description.<lang>.md
04-final-claim-review.<lang>.md
```

Examples: `01-user-manual.ru.md`, `01-user-manual.en.md`, `02-positioning-brief.pt-br.md`.

When multiple languages are requested, each language gets its own full artifact set.

## Repository Layout

```text
skills/
  b24-launchkit/
  b24-manual/
  b24-positioning/
  b24-description/
  b24-reviewer/
scripts/
  validate-skills.sh
  quick-validate-skill.py
```

## Installation

Paste this into your coding agent:

```text
Fetch and follow the installation instructions from
https://raw.githubusercontent.com/serg-vostrikov-bitrix/b24-launchkit-skills/main/INSTALL.md
```

For reproducible installs, prefer a tagged URL when a release tag is available,
for example:

```text
https://raw.githubusercontent.com/serg-vostrikov-bitrix/b24-launchkit-skills/v0.1.0/INSTALL.md
```

## Validation

Run:

```bash
scripts/validate-skills.sh
```

This validates the skill folders and checks for unresolved draft markers. The validator intentionally uses a dependency-free local frontmatter check, so it does not require PyYAML or network installation.

## Development Notes

- Keep `SKILL.md` concise and move only truly reusable details into bundled resources.
- Writing-style rules shared by all skills live in `skills/b24-launchkit/references/writing-style.md` (adapted from `ai-writing-detox`, MIT). Link to that file instead of copying its rules into a skill.
- Do not let downstream skills invent product claims that were not supported by upstream facts.

## Contributing

Improvements are welcome. Please propose changes through pull requests, keep
contributions in English, and include enough context for reviewers to understand
the intended behavior or documentation change.

## Current Scope

In scope:

- User-facing manuals for Bitrix24 apps
- Positioning briefs
- Bitrix24 Marketplace descriptions
- FAQ sections inside marketplace descriptions
- Final claim review against known facts and guardrails
- Artifact-specific review for manuals, positioning, descriptions, and final public text

Out of scope for the MVP:

- Automated marketplace quality scoring
- Multi-marketplace formatting
- Persistent artifact storage
- UI or CLI orchestration beyond the validation scripts

## License

MIT. See [LICENSE](LICENSE).
