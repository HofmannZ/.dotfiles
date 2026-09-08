# Dotfiles 🏡

Your machine, your rules. My everyday macOS setup: a comfy shell, development tools, and a home for the little things. Built for Apple Silicon, with defaults doing most of the work.

## The good stuff ✨

- **Shell:** Zsh, Antidote + Zephyr, and Starship.
- **Development:** Node LTS, pnpm for daily work, and Bun for the adventures. Ruby and Java are here too.
- **Agent wrangling:** [Herdr](https://herdr.dev/docs/install/) keeps the agent shells together.
- **Apps:** Ghostty, Zed, Docker, Google Cloud CLI, and friends. The `Brewfile` is the full guest list.

## Make yourself at home 🚀

Clone the repo:

```sh
git clone https://github.com/HofmannZ/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

Add your personal details:

```sh
./scripts/setup_config.sh
```

This asks for Git identity, an optional Font Awesome token, and your editor. Private settings live in `~/.config/dotfiles` and stay out of Git.

Give the `Brewfile` a look, then install:

```sh
./scripts/install.sh
```

Time for a coffee ☕. This installs packages and apps, links configs, registers Java 11, and sets up GPG pinentry and the GKE authentication plugin. It also shows hidden files in Finder and dims hidden apps in the Dock.

Open a new terminal when it finishes. Antidote downloads your plugins on the first launch.

## Everything in its place 🧹

- `.zshenv` — shared environment variables and private settings.
- `.zprofile` — Homebrew, SDK paths, and login setup.
- `.zshrc` — plugins, aliases, completions, and the prompt.
- `.zsh_plugins.txt` — the plugin list; Zephyr handles its own defaults.
- `config/` — Git and Starship settings.
- `scripts/` — setup and maintenance.

Configs are symlinked into `~` and `~/.config`. Existing files are backed up beside the originals with a `.backup.*` suffix. To restore one, remove its symlink and move the backup back into place.

Node, pnpm, and Bun are all managed through Homebrew. Node uses `node@24`, the current LTS line, with its binaries first on the shell's search path. Homebrew updates it within that major version; moving to the next LTS means updating the version in `Brewfile`, `.zprofile`, and `.zshrc`.

Flutter, Shorebird, and the Android SDK use their usual local paths; install those SDKs separately.

## Keep it fresh 🍃

```sh
dotup             # Link configs, then open a new terminal
brewup            # Zephyr's Homebrew update, upgrade, and cleanup
antidote update   # Refresh shell plugins
sysup             # Pull dotfiles, refresh the Brewfile packages and plugins
```

`sysup` uses a fast-forward-only pull and stops if a step fails. Symlinked edits take effect in new shells; `dotup` is also available directly as `./scripts/update.sh`.

Coming from the old setup? Zephyr now manages history with its defaults; your old `~/.zhistory` stays on disk. The separate pnpm/Node installer is gone, so open a fresh login shell after updating.

## Signed, sealed, delivered 🔑

For optional GPG commit signing:

```sh
./scripts/create_gpg.sh                   # If you need a key
./scripts/setup_gpg.sh <key-fingerprint>
```

The setup script enables signing and prints your public key for your Git host. Existing GPG agent settings are kept.
