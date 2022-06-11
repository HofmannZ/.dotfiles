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

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"                                       # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# google cloud sdk
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
