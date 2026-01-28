#!/usr/bin/env zsh

# dotfiles
alias dotup='. $DOTFILES/scripts/update.sh'

# homebrew
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'

# system
alias sysup='. $DOTFILES/scripts/update_system.sh'

# kubernetes
alias kap='kubectl apply -f'
alias kde='kubectl delete -f'

# ls
alias ls='ls -G'

# folder
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias d='dirs -v'           # Directory stack (use cd ~N to jump)

alias cdh='cd ~/Projects/github.com/HofmannZ'
alias cdz='cd ~/Projects/github.com/zino-hofmann'
alias cde='cd ~/Projects/github.com/expatfile'

# grep
alias grep='grep --color=auto'

# pnpm
alias pni='pnpm install'
alias pnd='pnpm dev'
alias pns='pnpm start'
alias pnx='(){ pnpm dlx $@; }'

# nvm
alias nv='(){ nvm use $1; }' # usage: 'nv 16' or 'nv lts'
