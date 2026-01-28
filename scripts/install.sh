#!/usr/bin/env zsh
set -e

DOTFILES="$(cd "$(dirname "$0")/.." && pwd)"

echo "🗂 Creating folders..."
[[ ! -d ~/Projects ]] && mkdir ~/Projects
[[ ! -d ~/Projects/github.com ]] && mkdir ~/Projects/github.com

if ! command -v brew &>/dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
[[ -x /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

echo "📦 Installing Homebrew packages and casks..."
brew bundle install --file="$DOTFILES/Brewfile"

echo "📎 Configuring Git..."
mkdir -p ~/.config/git
cp "$DOTFILES/config/git/config" ~/.config/git/config
git config --global include.path "$HOME/.config/git/config"
# Identity (user.name, user.email) is set by ./scripts/setup_config.sh or manually

echo "📦 Installing Pnpm..."
curl -fsSL https://get.pnpm.io/install.sh | sh -
export PNPM_HOME="${HOME}/Library/pnpm"
export PATH="${PNPM_HOME}:${PATH}"

echo "📦 Installing Node.js..."
pnpm env use --global lts

echo "📦 Installing Java..."
sudo ln -sfn "$(brew --prefix)/opt/openjdk@11/libexec/openjdk.jdk" /Library/Java/JavaVirtualMachines/openjdk-11.jdk

echo "📂 Copying ZSH config..."
cp "$DOTFILES/.zshenv" ~/.zshenv
cp "$DOTFILES/.zshrc" ~/.zshrc

echo "📂 Linking Starship config..."
mkdir -p ~/.config
ln -sf "$DOTFILES/config/starship.toml" ~/.config/starship.toml

echo "💾 Source ZSH config..."
source ~/.zshenv
source ~/.zshrc

echo "🔎 Configuring Google Cloud SDK..."
gcloud components install gke-gcloud-auth-plugin
$(gcloud info --format="value(basic.python_location)") -m pip install numpy

echo "🔑 Configuring GPG..."
mkdir ~/.gnupg
chown -R $(whoami) ~/.gnupg/
find ~/.gnupg -type f -exec chmod 600 {} \;
find ~/.gnupg -type d -exec chmod 700 {} \;
echo "pinentry-program $(brew --prefix)/bin/pinentry-mac" >~/.gnupg/gpg-agent.conf
echo RELOADAGENT | gpg-connect-agent

echo "🖥 Configuring MacOS..."
defaults write com.apple.finder AppleShowAllFiles -bool true # Show hidden files.
defaults write com.apple.Dock showhidden -bool true          # Dim hidden app icons in the Dock.

echo "\n🚀 ${GREEN_COLOR}Done!${DEFAULT_COLOR}"
