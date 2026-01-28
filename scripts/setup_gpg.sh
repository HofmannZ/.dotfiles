#!/usr/bin/env zsh

KEY_ID=$1

if (
  [ -z "${KEY_ID}" ]
); then
  echo "The key ID should be provided as a cli argument."
  echo "Usage:"
  echo "$ ./setup_gpg.sh key-id"
  exit 1
fi

git config --global user.signingkey "$KEY_ID"
git config --global commit.gpgsign true
git config --global gpg.program "$(command -v gpg)"

gpg --armor --export "$KEY_ID"
