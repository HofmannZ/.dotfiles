#!/usr/bin/env zsh

# /etc/zprofile runs path_helper before this file and may place system paths
# before Homebrew, so restore Homebrew's precedence for login shells.
typeset -U path PATH

[[ -d /opt/homebrew/sbin ]] && export PATH="/opt/homebrew/sbin:${PATH}"
[[ -d /opt/homebrew/bin ]] && export PATH="/opt/homebrew/bin:${PATH}"
