#!/usr/bin/env zsh

# folders
export WORKSPACE="$HOME/Projects"
export DOTFILES="$HOME/.dotfiles"
# folders end

# editor
export EDITOR="vim"
export VISUAL="vim"
# editor end

# timezone
export TZ=UTC
# timezone end

# zsh
export HISTFILE="$HOME/.zhistory" # History filepath
export HISTSIZE=10000             # Maximum events for internal history
export SAVEHIST=10000             # Maximum events in history file
# zsh end

# homebrew
export PATH="/usr/local/sbin:$PATH"
# homebrew end

# gpg
export GPG_TTY=$(tty)
# gpg end

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# google cloud sdk
export CLOUDSDK_PYTHON_SITEPACKAGES=1
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
# google cloud sdk end

# java configuration
export JAVA_HOME=$(/usr/libexec/java_home -v 11)
export APP_JAVA_HOME=$(/usr/libexec/java_home -v 11)
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/openjdk@11/include"
# java configuration end

# android configuration
export ANDROID_HOME=~/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/build-tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin/
# android configuration end

# ruby - need to make sure that use the homebrew ruby, not the system one
export PATH="/usr/local/opt/ruby/bin:$PATH"
# ruby end

# colors
export DEFAULT_COLOR="\033[39m"
export RED_COLOR="\\033[91m"
export GREEN_COLOR="\033[92m"
export ORANGE_COLOR="\033[93m"
export BLUE_COLOR="\033[94m"
export MAGENTA_COLOR="\033[95m"
export CYAN_COLOR="\033[96m"
# colors end
