export DOTFILES="$HOME/.dotfiles"
export WORKSPACE="$HOME/Projects"
export EDITOR="vim"
export VISUAL="$EDITOR"
export TZ=UTC

# Private settings stay outside the repository.
if [[ -r "$HOME/.config/dotfiles/fontawesome" ]]; then
  source "$HOME/.config/dotfiles/fontawesome"
fi
if [[ -r "$HOME/.config/dotfiles/editor" ]]; then
  source "$HOME/.config/dotfiles/editor"
fi
