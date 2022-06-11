#!/usr/bin/env zsh

setopt AUTO_CD           # Go to folder path without using cd.
setopt AUTO_PUSHD        # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS # Do not store duplicates in the stack.
setopt PUSHD_SILENT      # Do not print the directory stack after pushd or popd.
setopt CORRECT           # Spelling correction
setopt CDABLE_VARS       # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB     # Use extended globbing syntax.
