#!/usr/bin/env zsh

echo "📋 Updating dotfiles..."
CURRRENT_DIR=$(pwd)
cd $DOTFILES
git pull
dotup
cd $CURRRENT_DIR

echo "📋 Updating Mac apps..."
mas upgrade

echo "📋 Updating Homebrew..."
brewup

echo "📋 Updating Node.js..."
pnpm env use --global lts

echo "✅ All done!"