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
brew cask install ${HOMEBREW_FONTS[@]}

echo "Tapping casks..."
brew tap homebrew/cask

echo "Installing casks..."
HOMEBREW_CASKS=(
  adobe-creative-cloud
  android-studio
  dashlane
  docker
  fliqlo
  google-chrome
  google-cloud-sdk
  keybase
  slack
  transmission
  visual-studio-code
  vlc
  zeplin
)
brew cask install ${HOMEBREW_CASKS[@]}

echo "Copying ZSH config..."
cp .zshrc ~/.zshrc
cp .zsh/aliases.zsh ~/.zsh/aliases.zsh
cp .zsh/history.zsh ~/.zsh/history.zsh

echo "Source ZSH config..."
source ~/.zshrc

echo "Configuring default editor..."
code --install-extension EditorConfig.editorconfig
code --install-extension wix.vscode-import-cost
code --install-extension Orta.vscode-jest
code --install-extension esbenp.prettier-vscode
code --install-extension wayou.vscode-todo-highlight

echo "Configuring MacOS..."
# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Dim hidden app icons in the Dock
defaults write com.apple.Dock showhidden -bool true

echo "Done!"
