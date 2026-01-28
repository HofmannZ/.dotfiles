#!/usr/bin/env zsh

DOTFILES="$(cd "$(dirname "$0")/.." && pwd)"
CONFIG_DIR="${HOME}/.config/dotfiles"
CREATED=()

mkdir -p "$CONFIG_DIR"

echo "Create private config files under ${CONFIG_DIR}. Leave blank or answer n to skip.\n"

# Font Awesome
read "?Set up Font Awesome package token? (y/n) " REPLY
if [[ "$REPLY" =~ ^[yY] ]]; then
  read -s "?Paste token (input hidden): " TOKEN
  echo
  if [[ -n "$TOKEN" ]]; then
    echo "export FONT_AWESOME_PACKAGE_TOKEN=$TOKEN" > "$CONFIG_DIR/fontawesome"
    CREATED+=("$CONFIG_DIR/fontawesome")
  fi
fi

# Git identity (option b: run git config directly)
read "?Set up Git user.name and user.email? (y/n) " REPLY
if [[ "$REPLY" =~ ^[yY] ]]; then
  read "?Full name: " GIT_NAME
  read "?Email: " GIT_EMAIL
  if [[ -n "$GIT_NAME" && -n "$GIT_EMAIL" ]]; then
    git config --global user.name "$GIT_NAME"
    git config --global user.email "$GIT_EMAIL"
    CREATED+=("git config user.name, user.email")
  fi
fi

# Editor
read "?Set EDITOR/VISUAL for git/cron? (vim/code/zed/skip) " REPLY
case "$REPLY" in
  vim)
    EDITOR_CMD="vim"
    VISUAL_CMD="vim"
    ;;
  code)
    EDITOR_CMD="code -w"
    VISUAL_CMD="code -w"
    ;;
  zed)
    EDITOR_CMD="zed -w"
    VISUAL_CMD="zed -w"
    ;;
  *) ;;
esac
if [[ -n "$EDITOR_CMD" ]]; then
  {
    echo "export EDITOR=\"$EDITOR_CMD\""
    echo "export VISUAL=\"$VISUAL_CMD\""
  } > "$CONFIG_DIR/editor"
  CREATED+=("$CONFIG_DIR/editor")
fi

echo
if (( ${#CREATED[@]} )); then
  echo "Created:"
  printf '  - %s\n' "${CREATED[@]}"
  echo "\nDo not commit the contents of ~/.config/dotfiles."
else
  echo "Nothing created."
fi
