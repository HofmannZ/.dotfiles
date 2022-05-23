#!/usr/bin/env zsh

# folder
export WORKSPACE="$HOME/Projects"
export DOTFILES="$HOME/.dotfiles"

# editor
export EDITOR="vim"
export VISUAL="vim"

# timezone
export TZ=UTC

# zsh
export HISTFILE="$HOME/.zhistory"       # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# homebrew
export PATH="/usr/local/sbin:$PATH"

# gpg
export GPG_TTY=$(tty)

# google cloud sdk
export CLOUDSDK_PYTHON_SITEPACKAGES=1
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# colors
export DEFAULT_COLOR="\033[39m"
export RED_COLOR="\\033[91m"
export GREEN_COLOR="\033[92m"
export ORANGE_COLOR="\033[93m"
export BLUE_COLOR="\033[94m"
export MAGENTA_COLOR="\033[95m"
export CYAN_COLOR="\033[96m"
