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
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi
