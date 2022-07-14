#!/usr/bin/env zsh

echo "📂 Copying ZSH config..."
cp $DOTFILES/.zshenv ~/.zshenv
cp $DOTFILES/.zshrc ~/.zshrc

echo "📂 Sourcing dot files..."
source ~/.zshenv
source ~/.zshrc
