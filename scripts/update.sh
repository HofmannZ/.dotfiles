#!/usr/bin/env zsh

echo "Copying ZSH config..."
cp $DOTFILES/.zshenv ~/.zshenv
cp $DOTFILES/.zshrc ~/.zshrc

echo "Source ZSH config..."
source ~/.zshenv
source ~/.zshrc

echo "Done!"