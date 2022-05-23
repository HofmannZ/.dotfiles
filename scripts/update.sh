#!/usr/bin/env zsh

echo "📂 Copying ZSH config..."
cp $DOTFILES/.zshenv ~/.zshenv
cp $DOTFILES/.zshrc ~/.zshrc
echo "✅ Done copying ZSH config."

echo "📂 Copying source command to you clipboard..."
COMMAND="source ~/.zshenv; source ~/.zshrc;"
echo $COMMAND | pbcopy

echo "✅ Done copying the source command to you clipboard:\n     ${ORANGE_COLOR}${COMMAND}${DEFAULT_COLOR}\n\n💾 ${GREEN_COLOR}Paste and execute to source the updated config.${DEFAULT_COLOR}"
