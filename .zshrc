#!/usr/bin/env zsh

# navigation
source "${DOTFILES}/zsh/navigation.zsh"

# history
source "${DOTFILES}/zsh/history.zsh"

# aliases
source "${DOTFILES}/zsh/aliases.zsh"

# key bindings
source "${DOTFILES}/zsh/key-bindings.zsh"

# completion
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh-completions:${FPATH}"
  autoload -Uz compinit
  compinit -i
fi

# prompt
eval "$(starship init zsh)"

# auto suggestions
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# syntax highlighting
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# google cloud sdk
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"                                       # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
