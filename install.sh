#!/usr/bin/env bash
# Link the dotfiles in this repo into $HOME.
# Existing files are moved to <file>.bak.<timestamp>; links that already
# point at this repo are left alone. Runs under macOS /bin/bash 3.2.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

# "<file in repo>|<destination>"
LINKS=(
  ".zshrc|$HOME/.zshrc"
  ".aerospace.toml|$HOME/.aerospace.toml"
  ".ideavimrc|$HOME/.ideavimrc"
  "bordersrc|$HOME/.config/borders/bordersrc"
)

usage() {
  cat <<EOF
Usage: $(basename "$0") [--dry-run] [--help]

Symlink the dotfiles in $REPO_DIR into \$HOME.
Existing files are moved to <file>.bak.<timestamp> first.

  -n, --dry-run  print what would be done, change nothing
  -h, --help     show this help
EOF
}

DRY_RUN=0
for arg in "$@"; do
  case "$arg" in
    -n | --dry-run) DRY_RUN=1 ;;
    -h | --help)
      usage
      exit 0
      ;;
    *)
      echo "unknown option: $arg" >&2
      usage >&2
      exit 2
      ;;
  esac
done

run() {
  if [ "$DRY_RUN" -eq 1 ]; then
    echo "[dry-run] $*"
  else
    echo "$*"
    "$@"
  fi
}

TIMESTAMP="$(date +%Y%m%d%H%M%S)"
linked=0
skipped=0
backed_up=0

for entry in "${LINKS[@]}"; do
  src="$REPO_DIR/${entry%%|*}"
  dest="${entry#*|}"

  if [ ! -e "$src" ]; then
    echo "error: $src is missing from the repo" >&2
    exit 1
  fi

  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "skip $dest (already linked)"
    skipped=$((skipped + 1))
    continue
  fi

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    backup="$dest.bak.$TIMESTAMP"
    if [ -e "$backup" ] || [ -L "$backup" ]; then
      echo "error: backup $backup already exists, not overwriting" >&2
      exit 1
    fi
    run mv "$dest" "$backup"
    backed_up=$((backed_up + 1))
  fi

  dest_dir="$(dirname "$dest")"
  if [ ! -d "$dest_dir" ]; then
    run mkdir -p "$dest_dir"
  fi
  run ln -s "$src" "$dest"
  linked=$((linked + 1))
done

prefix=""
if [ "$DRY_RUN" -eq 1 ]; then
  prefix="[dry-run] "
fi
echo "${prefix}linked $linked, skipped $skipped, backed up $backed_up"
