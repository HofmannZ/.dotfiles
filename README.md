# Dotfiles

Your machine, your rules. Backup, restore, and sync preferences and settings—Brewfile, Zsh/git/starship config, GPG, editors. **Tested on macOS (Apple Silicon).**

## What you get ✨

The good stuff:

- **Shell:** Zsh, Starship prompt, fzf, zsh-autosuggestions, zsh-syntax-highlighting
- **Dev:** Git, gh, pnpm + Node (LTS), Ruby, Java 11; Flutter/Dart and Android tooling via casks
- **Editors:** VS Code and Zed (plus Fira Code); extensions via `setup_editor.sh`
- **Infra and tools:** Docker, Google Cloud SDK, GPG (signed commits), Redis; TablePlus, Kreya, etc.

## Setup 🚀

Five steps. You've got this.

**1. Clone** 📥

```sh
cd ~
git clone https://github.com/HofmannZ/.dotfiles.git
cd .dotfiles
```

**2. Create your config (first time only)** ⚙️

Quick chat with your dotfiles—run the interactive script so it knows who you are before install:

```sh
./scripts/setup_config.sh
```

It creates `~/.config/dotfiles` and prompts for Git name/email, optional Font Awesome token, and optional EDITOR (vim/code/zed). Do not commit the contents of `~/.config/dotfiles`; they are loaded by `.zshenv` when present.

**3. Install** 📦

```sh
./scripts/install.sh
```

The big one. Brewfile, `.zshenv`/`.zshrc`, Starship, Git, Pnpm/Node, Java, gcloud, GPG, macOS defaults. Grab a coffee ☕ if you want.

**4. VS Code** ✏️

In VS Code: `Command + Shift + P` → run **Shell Command: Install 'code' command in PATH**. Then install extensions:

```sh
./scripts/setup_editor.sh
```

**5. GPG (optional)** 🔑

When you have a key and want signed commits:

```sh
./scripts/setup_gpg.sh <key-id>
```

That's it. Go build something. 🎉

## Keeping the system up to date 🔄

From anywhere:

```sh
sysup
```

Dotfiles are copied, not symlinked. After you pull changes, run `dotup` to load the latest Zsh config into your shell.

## Flutter setup 📱

1. Run: `sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer; sudo xcodebuild -runFirstLaunch; sudo xcodebuild -license`
2. Run: `sudo gem install cocoapods`
3. Launch Android Studio, install the SDK command-line tools, set up an AVD
4. Run: `flutter doctor --android-licenses`

## Troubleshooting 🔧

If gcloud suggests installing NumPy for tunnel performance:

```sh
$(gcloud info --format="value(basic.python_location)") -m pip install numpy
```
