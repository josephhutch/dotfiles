#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Bootstrapping dotfiles from: $DOTFILES_DIR"

# ------------------------------------------------------------
# Homebrew
# ------------------------------------------------------------

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Homebrew already installed."
fi

# ------------------------------------------------------------
# Packages
# ------------------------------------------------------------

brew bundle --file="$DOTFILES_DIR/Brewfile"

# ------------------------------------------------------------
# Dotfiles
# ------------------------------------------------------------

cd "$DOTFILES_DIR"

packages_to_stow=(
  zsh
  git
  mise
)

echo "Stowing ${packages_to_stow[*]}..."
stow --target="$HOME" --no-folding --restow "${packages_to_stow[@]}"

echo "Done."
