#!/usr/bin/env zsh

# navigation
source $DOTFILES/zsh/navigation.zsh

# history
source $DOTFILES/zsh/history.zsh

# aliases
source $DOTFILES/zsh/aliases.zsh

# key bindings
source $DOTFILES/zsh/key-bindings.zsh

# completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit -i
fi

# prompt
eval "$(starship init zsh)"

# auto suggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# google cloud sdk
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
