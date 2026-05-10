#!/usr/bin/env zsh

echo "📋 Updating dotfiles..."
(cd "$DOTFILES" && git pull && dotup)

echo "📋 Updating Homebrew..."
brewup

echo "📋 Updating Pnpm..."
pnpm self-update

echo "📋 Updating Node.js..."
pnpm runtime set node lts -g

echo "✅ All done!"
