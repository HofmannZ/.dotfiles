#!/usr/bin/env zsh
set -e

DOTFILES="$(cd "$(dirname "$0")/.." && pwd)"

mkdir -p "$HOME/Projects/github.com"
if [[ ! -x /opt/homebrew/bin/brew ]]; then
  print -r -- '🍺 Installing Homebrew...'
  # Capture the download first so a failed request cannot look like a successful install.
  installer="$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  /bin/bash -c "$installer"
fi
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

print -r -- '📦 Installing packages and apps...'
brew bundle install --file="$DOTFILES/Brewfile"

zsh "$DOTFILES/scripts/update.sh"

print -r -- '☕ Registering Java 11...'
sudo mkdir -p /Library/Java/JavaVirtualMachines
sudo ln -sfn "$HOMEBREW_PREFIX/opt/openjdk@11/libexec/openjdk.jdk" /Library/Java/JavaVirtualMachines/openjdk-11.jdk

print -r -- '☁️ Installing the GKE authentication plugin...'
gcloud components install gke-gcloud-auth-plugin --quiet

print -r -- '🔑 Configuring GPG pinentry...'
gnupg_home="${GNUPGHOME:-$HOME/.gnupg}"
mkdir -p "$gnupg_home"
chmod 700 "$gnupg_home"
# Preserve existing agent settings, including a user's chosen pinentry program.
if ! /usr/bin/grep -Eq '^[[:space:]]*pinentry-program[[:space:]]' "$gnupg_home/gpg-agent.conf" 2>/dev/null; then
  (umask 077; printf '\npinentry-program %s/bin/pinentry-mac\n' "$HOMEBREW_PREFIX" >> "$gnupg_home/gpg-agent.conf")
fi
gpgconf --reload gpg-agent

print -r -- '🖥️ Configuring macOS...'
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.dock showhidden -bool true

print -r -- '✨ All set. Open a new terminal or run: exec zsh -l'
