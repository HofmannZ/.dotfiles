#!/usr/bin/env zsh
[[ -o interactive ]] || return

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
  ZSH_COMPDUMP="${ZDOTDIR:-$HOME}/.zcompdump"
  autoload -Uz compinit
  compinit -d "$ZSH_COMPDUMP" -i
fi

# prompt
command -v starship &>/dev/null && eval "$(starship init zsh)"

# fzf
command -v fzf &>/dev/null && source <(fzf --zsh)

# auto suggestions, syntax highlighting, gcloud, ruby (require Homebrew)
if type brew &>/dev/null; then
  source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  [[ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ]] && \
    source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
  [[ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc" ]] && \
    source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
  # ruby - use homebrew ruby, not system
  export PATH="/opt/homebrew/opt/ruby/bin:${PATH}"
  export PATH="${PATH}:$(gem environment gemdir)/bin"
fi
# ruby end

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
