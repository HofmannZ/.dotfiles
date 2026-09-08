#!/usr/bin/env zsh
set -e

DOTFILES="$(cd "$(dirname "$0")/.." && pwd)"
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

print -r -- '📂 Updating dotfiles...'
git -C "$DOTFILES" pull --ff-only
zsh "$DOTFILES/scripts/update.sh"

print -r -- '🍺 Updating Homebrew packages...'
brew update
brew bundle install --file="$DOTFILES/Brewfile"
brew cleanup

print -r -- '🐚 Updating shell plugins...'
source "$HOMEBREW_PREFIX/opt/antidote/share/antidote/antidote.zsh"
antidote update --bundles

brew doctor
print -r -- '✨ All done. Open a new terminal to pick up the changes.'
