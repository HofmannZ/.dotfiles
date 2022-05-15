#!/usr/bin/env zsh

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

# grep
alias grep='grep --color=auto'

# npm
alias ns='npm run start'
alias nci='npm run clean:install'

# yarn
alias yd='yarn dev'
alias ys='yarn start'
