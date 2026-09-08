# Homebrew (Apple Silicon).
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

export ANDROID_HOME="$HOME/Library/Android/sdk"

# Java 11.
if [[ -d "$HOMEBREW_PREFIX/opt/openjdk@11" ]]; then
  export JAVA_HOME="$HOMEBREW_PREFIX/opt/openjdk@11/libexec/openjdk.jdk/Contents/Home"
  export APP_JAVA_HOME="$JAVA_HOME"
fi

# Keep the first occurrence of each PATH entry.
typeset -U path
path=(
  "$HOMEBREW_PREFIX/opt/node@24/bin"
  "$HOME/.local/bin"
  "$HOMEBREW_PREFIX/opt/ruby/bin"
  "$HOMEBREW_PREFIX/opt/openjdk@11/bin"
  "$WORKSPACE/flutter/bin"
  "$HOME/.shorebird/bin"
  $path
  "$ANDROID_HOME/cmdline-tools/latest/bin"
  "$ANDROID_HOME/platform-tools"
  "$HOME/.pub-cache/bin"
)
