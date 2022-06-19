#!/usr/bin/env zsh

# dotfiles
alias dotup='. ~/.dotfiles/scripts/update.sh'

# homebrew
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'

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
alias cda='cd ~/Projects/github.com/Stichting-Adriaan-van-Royen'

# grep
alias grep='grep --color=auto'

# pnpm
alias ni='pnpm install'
alias nd='pnpm dev'
alias ns='pnpm start'
alias nv='(){ pnpm env use --global $1; }' # usage: 'nv 16' or 'nv lts'

# yarn
alias yd='yarn dev'
alias ys='yarn start'
