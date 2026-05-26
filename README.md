# B24 LaunchKit Skills

Agent skills for preparing release and marketplace documentation for Bitrix24 applications.

The project is designed as a small documentation pipeline: start from project evidence, existing docs, or old marketplace copy; produce a factual user manual; turn it into a positioning brief; write public marketplace-ready text; then review the result with finite, artifact-specific criteria.

The orchestrator is intentionally strict: for project-based work it asks for task controls first, then runs the artifact stages through real subagents by default and produces visible artifacts in order. It does not skip straight to marketplace copy, generate multiple languages, browse for marketplace rules, or silently fall back to current-dialog execution unless the user explicitly asks for that route.

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

The orchestrator computes the exact artifact paths before launching subagents and passes those paths in each subagent prompt. Subagents must write only the requested artifact file and must read the upstream artifact file for the same language when a stage depends on previous output. The reviewer stage reads the same-language manual, positioning brief, and marketplace description before writing `04-final-claim-review.<lang>.md`.

If subagent tooling is unavailable, the orchestrator must stop before artifact production and ask whether to continue in the current dialog as a fallback.

## Repository Layout

```text
skills/
  b24-launchkit/
  b24-manual/
  b24-positioning/
  b24-description/
  b24-reviewer/
scripts/
  install-local-skills.sh
  validate-skills.sh
  quick-validate-skill.py
```

The repository is the source of truth. The local Codex skills directory (`~/.codex/skills`) is only an install target for testing and real use.

## Local Installation

### Install With Your Agent

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

### Install Locally For Codex

Install the skills into Codex with symlinks:

```bash
scripts/install-local-skills.sh
```

If symlinks are not suitable in your environment, copy the skills instead:

```bash
scripts/install-local-skills.sh copy
```

By default, the installer targets:

```text
${CODEX_HOME:-$HOME/.codex}/skills
```

You can override the target directory:

```bash
CODEX_SKILLS_DIR=/path/to/skills scripts/install-local-skills.sh
```

After installation, restart or refresh Codex if the new skills do not appear in the current session.

## Validation

Run:

```bash
scripts/validate-skills.sh
```

This validates the skill folders and checks for unresolved draft markers. The validator intentionally uses a dependency-free local frontmatter check, so it does not require PyYAML or network installation.

## Development Notes

- Edit files under `skills/`, not under `~/.codex/skills`.
- Keep `SKILL.md` concise and move only truly reusable details into bundled resources.
- Do not let downstream skills invent product claims that were not supported by upstream facts.
- Keep old general-purpose skills such as `user-manual-from-project` and `marketplace-card-optimizer` as references or fallback tools; this project owns the Bitrix24-specific launch pipeline.

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
- UI or CLI orchestration beyond the install and validation scripts

## License

MIT. See [LICENSE](LICENSE).
