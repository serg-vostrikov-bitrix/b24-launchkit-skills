#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CODEX_SKILLS_DIR="${CODEX_SKILLS_DIR:-${CODEX_HOME:-$HOME/.codex}/skills}"
MODE="${1:-link}"

skills=(
  b24-launchkit
  b24-manual
  b24-positioning
  b24-description
  b24-reviewer
)

mkdir -p "$CODEX_SKILLS_DIR"

for skill in "${skills[@]}"; do
  src="$ROOT/skills/$skill"
  dest="$CODEX_SKILLS_DIR/$skill"

  if [[ ! -f "$src/SKILL.md" ]]; then
    echo "Missing skill: $src/SKILL.md" >&2
    exit 1
  fi

  case "$MODE" in
    link)
      ln -sfn "$src" "$dest"
      ;;
    copy)
      rm -rf "$dest"
      mkdir -p "$dest"
      cp -R "$src/." "$dest/"
      ;;
    *)
      echo "Usage: $0 [link|copy]" >&2
      exit 2
      ;;
  esac

  echo "Installed $skill -> $dest"
done

echo "Restart or refresh Codex if the skills do not appear in the current session."
