#!/usr/bin/env zsh
set -e

if (( $# != 1 )) || [[ -z "$1" || "$1" == -* ]]; then
  print -ru2 -- "Usage: $0 <key-id-or-fingerprint>"
  exit 1
fi
key_id="$1"
# Validate the secret key and export before enabling signing globally.
gpg --list-secret-keys "$key_id"
public_key="$(gpg --armor --export "$key_id")"
[[ -n "$public_key" ]] || exit 1

git config --global user.signingkey "$key_id"
git config --global commit.gpgsign true
git config --global gpg.program "${commands[gpg]}"
print -r -- "$public_key"
