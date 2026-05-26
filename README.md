# B24 LaunchKit Skills

Codex skills for preparing release and marketplace documentation for Bitrix24 applications.

The project is designed as a small documentation pipeline: start from project evidence, existing docs, or old marketplace copy; produce a factual user manual; turn it into a positioning brief; then write public marketplace-ready text with a final claim review.

## Skills

- `b24-launchkit` - orchestrates the full workflow and performs the final claim review.
- `b24-manual` - extracts confirmed user-facing facts from project evidence and writes a factual manual.
- `b24-positioning` - turns the manual or old copy into a positioning brief with audience, value, limits, and `Do Not Claim` guardrails.
- `b24-description` - writes public text such as a marketplace headline, description, and FAQ without inventing unsupported capabilities.

## Workflow

```text
source material
  -> factual manual
  -> positioning brief
  -> marketplace description
  -> final claim review
```

Source material can be a project repository, existing documentation, a user manual draft, product notes, or an old marketplace description.

Supported routes:

- Project only: `b24-manual -> b24-positioning -> b24-description -> final review`
- Existing manual: `b24-positioning -> b24-description -> final review`
- Existing marketplace text: `b24-positioning -> b24-description -> final review`
- Manual only: `b24-manual`
- Wording cleanup only: `b24-description` with strict meaning-preservation rules

## Repository Layout

```text
skills/
  b24-launchkit/
  b24-manual/
  b24-positioning/
  b24-description/
scripts/
  install-local-skills.sh
  validate-skills.sh
  quick-validate-skill.py
```

The repository is the source of truth. The local Codex skills directory (`~/.codex/skills`) is only an install target for testing and real use.

## Local Installation

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

This validates the four skill folders and checks for unresolved draft markers. The validator intentionally uses a dependency-free local frontmatter check, so it does not require PyYAML or network installation.

## Development Notes

- Edit files under `skills/`, not under `~/.codex/skills`.
- Keep `SKILL.md` concise and move only truly reusable details into bundled resources.
- Do not let downstream skills invent product claims that were not supported by upstream facts.
- Keep old general-purpose skills such as `user-manual-from-project` and `marketplace-card-optimizer` as references or fallback tools; this project owns the Bitrix24-specific launch pipeline.

## Current Scope

In scope:

- User-facing manuals for Bitrix24 apps
- Positioning briefs
- Bitrix24 Marketplace descriptions
- FAQ text
- Final claim review against known facts and guardrails

Out of scope for the MVP:

- A separate `b24-claim-check` skill
- Automated marketplace quality scoring
- Multi-marketplace formatting
- Persistent artifact storage
- UI or CLI orchestration beyond the install and validation scripts
