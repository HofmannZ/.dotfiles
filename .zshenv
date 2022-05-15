#!/usr/bin/env zsh

# folder
export WORKSPACE="$HOME/Projects"
export DOTFILES="$HOME/.dotfiles"

# editor
export EDITOR="vim"
export VISUAL="code"

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