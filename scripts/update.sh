#!/usr/bin/env zsh
set -e

DOTFILES="$(cd "$(dirname "$0")/.." && pwd)"

# Back up an existing config before replacing it with a symlink.
link_config() {
  local source_path="$1" target="$2"
  [[ "$source_path" -ef "$target" ]] && return 0
  if [[ -e "$target" || -L "$target" ]]; then
    local backup="$target.backup.$(date +%Y%m%d-%H%M%S).$$"
    mv "$target" "$backup"
    print -r -- "📦 Backed up $target to $backup"
  fi
  ln -s "$source_path" "$target"
}

print -r -- '📂 Linking configs...'
mkdir -p "$HOME/.config/git"
for file in .zshenv .zprofile .zshrc .zsh_plugins.txt; do
  link_config "$DOTFILES/$file" "$HOME/$file"
done
link_config "$DOTFILES/config/starship.toml" "$HOME/.config/starship.toml"
link_config "$DOTFILES/config/git/config" "$HOME/.config/git/config"

# Add our include without replacing other Git configuration.
if ! git config --global --get-all include.path | grep -Fxq "$HOME/.config/git/config"; then
  git config --global --add include.path "$HOME/.config/git/config"
fi

print -r -- '✨ Ready. Open a new terminal or run: exec zsh -l'
