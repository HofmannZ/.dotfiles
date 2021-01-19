#! /bin/zsh

echo "Creating folders..."
[[ ! -d ~/.zsh ]] && mkdir ~/.zsh
[[ ! -d ~/Projects ]] && mkdir ~/Projects

if test ! $(which brew); then
  echo "Installing Homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Updating Homebrew..."
brew update

echo "Installing Homebrew packages..."
HOMEBREW_PACKAGES=(
  starship
  zsh-completions
  git
  nvm
  typescript
  kubectl
  gnupg
  pinentry-mac
  hashicorp/tap/vault
  hashicorp/tap/consul
  hashicorp/tap/nomad
  hashicorp/tap/terrafrom
  hashicorp/tap/packer
)
brew install ${HOMEBREW_PACKAGES[@]}

echo "Configuring Git..."
git config --global user.name "Zino Hofmann"
git config --global user.email "zino@hofmann.amsterdam"
git config --global credential.helper osxkeychain
git config --global color.ui auto

echo "Tapping fonts..."
brew tap homebrew/cask-fonts

echo "Install fonts..."
HOMEBREW_FONTS=(
  font-fira-code
)
brew install --cask ${HOMEBREW_FONTS[@]}

echo "Tapping casks..."
brew tap homebrew/cask

echo "Installing casks..."
HOMEBREW_CASKS=(
  adobe-creative-cloud
  android-studio
  dashlane
  docker
  fanny
  fliqlo
  google-chrome
  google-cloud-sdk
  keybase
  sketch
  slack
  transmission
  vagrant
  visual-studio-code
  vlc
  zeplin
)
brew install --cask ${HOMEBREW_CASKS[@]}

echo "Copying ZSH config..."
cp .zshrc ~/.zshrc
cp .zsh/aliases.zsh ~/.zsh/aliases.zsh
cp .zsh/history.zsh ~/.zsh/history.zsh

echo "Source ZSH config..."
source ~/.zshrc

echo "Configuring default editor..."
code --install-extension apollographql.vscode-apollo
code --install-extension dart-code.dart-code
code --install-extension dart-code.flutter
code --install-extension dbaeumer.vscode-eslint
code --install-extension editorconfig.editorconfig
code --install-extension esbenp.prettier-vscode
code --install-extension johnpapa.vscode-peacock
code --install-extension ms-azuretools.vscode-docker
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension wakatime.vscode-wakatime
code --install-extension wayou.vscode-todo-highlight
code --install-extension wesbos.theme-cobalt2
code --install-extension wix.vscode-import-cost
code --install-extension wmaurer.change-case
code --install-extension zxh404.vscode-proto3

echo "Configuring MacOS..."
# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Dim hidden app icons in the Dock
defaults write com.apple.Dock showhidden -bool true

echo "Done!"
