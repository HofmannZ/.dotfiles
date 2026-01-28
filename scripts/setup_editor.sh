#!/usr/bin/env zsh

command -v code &>/dev/null || {
  echo "Run 'Shell Command: Install code in PATH' in VS Code first."
  exit 1
}

echo "🎨 Configuring default editor..."
code --install-extension apollographql.vscode-apollo
code --install-extension dart-code.dart-code
code --install-extension dart-code.flutter
code --install-extension dbaeumer.vscode-eslint
code --install-extension editorconfig.editorconfig
code --install-extension esbenp.prettier-vscode
code --install-extension ms-azuretools.vscode-docker
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension wayou.vscode-todo-highlight
code --install-extension wix.vscode-import-cost
code --install-extension wmaurer.change-case
code --install-extension Tyriar.sort-lines
