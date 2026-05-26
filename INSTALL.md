# Agent Installation Instructions

These instructions are for AI coding agents. Follow them to install the B24
LaunchKit skills into the current agent environment.

Repository:

```text
https://github.com/serg-vostrikov-bitrix/b24-launchkit-skills
```

Raw instruction URL:

```text
https://raw.githubusercontent.com/serg-vostrikov-bitrix/b24-launchkit-skills/main/INSTALL.md
```

## Goal

Install these skills so the current agent can discover and use them:

- `b24-launchkit`
- `b24-manual`
- `b24-positioning`
- `b24-description`
- `b24-reviewer`

Each skill is a directory under `skills/` and must be installed as a directory,
not flattened into a single file.

## Installation Rules

1. Detect the current agent environment and its skills directory.
2. Prefer copying skill directories for normal installation.
3. Use symlinks only for local development from a persistent checkout.
4. Preserve each skill directory exactly, including `SKILL.md`, `agents/`, and
   `references/`.
5. Do not edit, summarize, translate, or merge the skill contents during
   installation.
6. Validate that every installed skill directory contains `SKILL.md`.
7. Tell the user where the skills were installed and whether the agent needs a
   restart or refresh.

## Known Targets

### Codex

Install into:

```text
${CODEX_HOME:-$HOME/.codex}/skills
```

If `CODEX_SKILLS_DIR` is set, use it instead:

```text
$CODEX_SKILLS_DIR
```

### Unknown Agent

If the current agent has no known skills directory, do one of the following:

1. Ask the user for the target skills directory.
2. Or install into a local `./installed-skills/` directory and explain that the
   user must point their agent at that directory.

Do not guess a destructive or system-wide location.

## Preferred Procedure

1. Clone or download the repository into a temporary or user-approved location.
2. Locate the source skill directories under `skills/`.
3. Create the target skills directory if it does not exist.
4. Copy each required skill directory into the target directory.
5. Run validation checks:
   - each target skill directory exists;
   - each target skill directory contains `SKILL.md`;
   - bundled files such as `agents/` and `references/` are preserved when
     present.
6. Report the result to the user.

## Local Development Procedure

If the user is working inside a persistent checkout of this repository, use the
bundled installer:

```bash
scripts/install-local-skills.sh
```

For environments where symlinks are unsuitable, copy instead:

```bash
scripts/install-local-skills.sh copy
```

Then validate:

```bash
scripts/validate-skills.sh
```

## Agent Prompt For Users

Users can paste this into their coding agent:

```text
Fetch and follow the installation instructions from
https://raw.githubusercontent.com/serg-vostrikov-bitrix/b24-launchkit-skills/main/INSTALL.md
```

For reproducible installs, prefer a release tag instead of `main` when one is
available.
