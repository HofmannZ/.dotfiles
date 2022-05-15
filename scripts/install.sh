#!/usr/bin/env zsh

echo "Creating folders..."
[[ ! -d ~/Projects ]] && mkdir ~/Projects
[[ ! -d ~/Projects/github.com ]] && mkdir ~/Projects/github.com

if test ! $(which brew); then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing Homebrew packages..."
HOMEBREW_PACKAGES=(
  git
  gnupg
  hashicorp/tap/consul
  hashicorp/tap/nomad
  hashicorp/tap/packer
  hashicorp/tap/terraform
  hashicorp/tap/vault
  nvm
  pinentry-mac
  starship
  zsh
  zsh-completions
  zsh-syntax-highlighting
)
brew install ${HOMEBREW_PACKAGES[@]}

echo "Configuring Git..."
git config --global user.name "Zino Hofmann"
git config --global user.email "zino@hofmann.amsterdam"
git config --global credential.helper osxkeychain
git config --global color.ui auto

echo "Configuring NVM..."
mkdir ~/.nvm

echo "Tapping fonts..."
brew tap homebrew/cask-fonts

echo "Installing casks..."
HOMEBREW_CASKS=(
  adobe-creative-cloud
  android-studio
  bloomrpc
  docker
  font-fira-code
  google-chrome
  google-cloud-sdk
  keybase
  tableplus
  transmission
  visual-studio-code
  vlc
)
brew install --cask ${HOMEBREW_CASKS[@]}

echo "Copying ZSH config..."
cp .zshenv ~/.zshenv
cp .zshrc ~/.zshrc

echo "Source ZSH config..."
source ~/.zshenv
source ~/.zshrc

echo "Instaling Node.js..."
nvm install 16

echo "Configuring GPG..."
mkdir ~/.gnupg
chown -R $(whoami) ~/.gnupg/
find ~/.gnupg -type f -exec chmod 600 {} \;
find ~/.gnupg -type d -exec chmod 700 {} \;
echo "pinentry-program $(brew --prefix)/bin/pinentry-mac" > ~/.gnupg/gpg-agent.conf
echo RELOADAGENT | gpg-connect-agent

echo "Configuring MacOS..."
defaults write com.apple.finder AppleShowAllFiles -bool true  # Show hidden files.
defaults write com.apple.Dock showhidden -bool true           # Dim hidden app icons in the Dock.

echo "Done! 🚀"
