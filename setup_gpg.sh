#! /bin/zsh

KEY_ID=$1

if (
  [ -z "${KEY_ID}" ]
)
then
  echo "The key ID should be provided as a cli argument."
  echo "Usage:"
  echo "$ ./setup_gpg.sh key-id"
  exit 1;
fi

chown -R $(whoami) ~/.gnupg/

find ~/.gnupg -type f -exec chmod 600 {} \;
find ~/.gnupg -type d -exec chmod 700 {} \;

echo "pinentry-program /usr/localbin/pinentry-mac"/ > ~/.gnupg/gpg-agent.conf

keybase pgp export -q $KEY_ID | gpg --import
keybase pgp export -q $KEY_ID --secret | gpg --allow-secret-key-import --import

git config --global gpg.program $(which gpg)
git config --global user.signingkey $KEY_ID
git config --global commit.gpgsign true
