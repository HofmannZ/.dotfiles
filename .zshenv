export DOTFILES="$HOME/.dotfiles"
export WORKSPACE="$HOME/Projects"
export EDITOR="vim"
export VISUAL="$EDITOR"
export TZ=UTC

# Without this, Bun follows XDG_CACHE_HOME and keeps global packages in a cache.
export BUN_INSTALL="$HOME/.bun"

# Private settings stay outside the repository.
if [[ -r "$HOME/.config/dotfiles/fontawesome" ]]; then
  source "$HOME/.config/dotfiles/fontawesome"
fi
if [[ -r "$HOME/.config/dotfiles/editor" ]]; then
  source "$HOME/.config/dotfiles/editor"
fi
