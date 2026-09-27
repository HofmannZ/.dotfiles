# Plugins.
zstyle ':zephyr:plugin:completion' use-cache yes
# Keep Node LTS ahead of other Node installations when Zephyr sets PATH.
zstyle ':zephyr:plugin:environment' prepath \
  /opt/homebrew/opt/node@24/bin \
  "$HOME/bin" "$HOME/sbin" "$HOME/.local/bin" "$HOME/.local/sbin"
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load

source "$DOTFILES/zsh/aliases.zsh"

# Shell integrations.
if [[ -t 0 ]]; then
  export GPG_TTY="$(tty)"
fi
if [[ -r "$HOMEBREW_PREFIX/share/google-cloud-sdk/completion.zsh.inc" ]]; then
  source "$HOMEBREW_PREFIX/share/google-cloud-sdk/completion.zsh.inc"
fi

# Rust completions, regenerated whenever rustup updates itself.
() {
  local rustup="$HOME/.cargo/bin/rustup" dir="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/completions"
  [[ -x "$rustup" ]] || return 0
  if [[ ! "$dir/_rustup" -nt "$rustup" ]]; then
    mkdir -p "$dir"
    "$rustup" completions zsh >| "$dir/_rustup"
    "$rustup" completions zsh cargo >| "$dir/_cargo"
  fi
  fpath=("$dir" $fpath)
}

if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi
