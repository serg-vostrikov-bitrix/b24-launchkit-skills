#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VALIDATOR="${SKILL_VALIDATOR:-$ROOT/scripts/quick-validate-skill.py}"

skills=(
  b24-launchkit
  b24-manual
  b24-positioning
  b24-description
)

for skill in "${skills[@]}"; do
  python3 "$VALIDATOR" "$ROOT/skills/$skill"
done

if rg -n "TO.DO|TB.D|FIX.ME|place.holder|fill.in|implement.la.er" "$ROOT/skills"; then
  echo "Draft markers found" >&2
  exit 1
fi

echo "All B24 LaunchKit skills validated."
