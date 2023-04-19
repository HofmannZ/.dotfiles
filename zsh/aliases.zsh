#!/usr/bin/env zsh

# dotfiles
alias dotup='. ~/.dotfiles/scripts/update.sh'

# homebrew
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'

# system
alias sysup='. ~/.dotfiles/scripts/update_system.sh'

# kubernetes
alias kap='kubectl apply -f'
alias kde='kubectl delete -f'

# ls
alias ls='ls -G'

# folder
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias cdh='cd ~/Projects/github.com/HofmannZ'
alias cdz='cd ~/Projects/github.com/zino-hofmann'
alias cde='cd ~/Projects/github.com/expatfile'
alias cda='cd ~/Projects/github.com/Stichting-Adriaan-van-Royen'

# grep
alias grep='grep --color=auto'

# pnpm
alias pni='pnpm install'
alias pnd='pnpm dev'
alias pns='pnpm start'
alias pnx='(){ pnpm dlx $@; }'

# nvm
alias nv='(){ nvm use $1; }' # usage: 'nv 16' or 'nv lts'

# yarn
alias yd='yarn dev'
alias ys='yarn start'
