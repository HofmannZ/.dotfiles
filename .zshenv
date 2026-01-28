#!/usr/bin/env zsh

# folders
export WORKSPACE="${HOME}/Projects"
export DOTFILES="${HOME}/.dotfiles"
# folders end

# editor
export EDITOR="vim"
export VISUAL="vim"
# editor end

# timezone
export TZ=UTC
# timezone end

# zsh
export HISTFILE="${HOME}/.zhistory" # History filepath
export HISTSIZE=10000               # Maximum events for internal history
export SAVEHIST=10000               # Maximum events in history file
# zsh end

# homebrew (Apple Silicon)
[[ -d /opt/homebrew/bin ]] && export PATH="/opt/homebrew/bin:${PATH}"
[[ -d /opt/homebrew/sbin ]] && export PATH="/opt/homebrew/sbin:${PATH}"
# homebrew end

# gpg
export GPG_TTY=$(tty 2>/dev/null)
# gpg end

# pnpm
export PNPM_HOME="${HOME}/Library/pnpm"
export PATH="${PNPM_HOME}:${PATH}"
# pnpm end

# google cloud sdk
export CLOUDSDK_PYTHON_SITEPACKAGES=1
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
# google cloud sdk end

# java configuration (only when Java 11 is installed)
if /usr/libexec/java_home -v 11 &>/dev/null; then
  export JAVA_HOME=$(/usr/libexec/java_home -v 11)
  export APP_JAVA_HOME=$(/usr/libexec/java_home -v 11)
  export PATH="/opt/homebrew/opt/openjdk@11/bin:${PATH}"
  export CPPFLAGS="-I/opt/homebrew/opt/openjdk@11/include"
fi
# java configuration end

# android configuration
export ANDROID_HOME="${HOME}/Library/Android/sdk"
export PATH="${PATH}:${ANDROID_HOME}/build-tools"
export PATH="${PATH}:${ANDROID_HOME}/platform-tools"
export PATH="${PATH}:${ANDROID_HOME}/tools"
export PATH="${PATH}:${ANDROID_HOME}/tools/bin/"
# android configuration end

# flutter
export PATH="${WORKSPACE}/flutter/bin:${PATH}"
# flutter end

# dart
export PATH="${PATH}:${HOME}/.pub-cache/bin"
# dart end

# shorebird
export PATH="${HOME}/.shorebird/bin:${PATH}"
# shorebird end

# fontawesome (set FONT_AWESOME_PACKAGE_TOKEN in ~/.config/dotfiles/fontawesome; see README)
[[ -f "${HOME}/.config/dotfiles/fontawesome" ]] && source "${HOME}/.config/dotfiles/fontawesome"
# fontawesome end

# editor override (set by ./scripts/setup_config.sh)
[[ -f "${HOME}/.config/dotfiles/editor" ]] && source "${HOME}/.config/dotfiles/editor"
# editor end

# colors
export DEFAULT_COLOR="\033[39m"
export RED_COLOR="\033[91m"
export GREEN_COLOR="\033[92m"
export ORANGE_COLOR="\033[93m"
export BLUE_COLOR="\033[94m"
export MAGENTA_COLOR="\033[95m"
export CYAN_COLOR="\033[96m"
# colors end
