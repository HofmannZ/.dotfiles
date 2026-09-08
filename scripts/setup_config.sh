#!/usr/bin/env zsh
set -e
umask 077

config_dir="$HOME/.config/dotfiles"
mkdir -p "$config_dir"
chmod 700 "$config_dir"
print -r -- "Private config lives in $config_dir. Answer n or leave blank to skip."

read -r 'reply?Set up Font Awesome package token? (y/n) '
if [[ "$reply" == [yY]* ]]; then
  read -rs 'token?Paste token (input hidden): '
  print
  if [[ -n "$token" ]]; then
    # Shell-quote the value so special characters remain data when sourced.
    printf 'export FONT_AWESOME_PACKAGE_TOKEN=%s\n' "${(qq)token}" > "$config_dir/fontawesome"
    chmod 600 "$config_dir/fontawesome"
    unset token
  fi
fi

read -r 'reply?Set up Git user.name and user.email? (y/n) '
if [[ "$reply" == [yY]* ]]; then
  read -r 'git_name?Full name: '
  read -r 'git_email?Email: '
  if [[ -n "$git_name" && -n "$git_email" ]]; then
    git config --global user.name "$git_name"
    git config --global user.email "$git_email"
  fi
fi

read -r 'reply?Set EDITOR/VISUAL? (vim/code/zed/skip) '
editor_cmd=""
case "$reply" in
  vim) editor_cmd=vim ;;
  code) editor_cmd='code -w' ;;
  zed) editor_cmd='zed -w' ;;
esac
if [[ -n "$editor_cmd" ]]; then
  {
    printf 'export EDITOR=%s\n' "${(qq)editor_cmd}"
    printf 'export VISUAL=%s\n' "${(qq)editor_cmd}"
  } > "$config_dir/editor"
  chmod 600 "$config_dir/editor"
fi
print -r -- 'Done. Private files stay outside the repository.'
