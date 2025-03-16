# Dotfiles

Dotfiles to backup, restore, and sync my preferences and settings.

## How to use

Clone the repository in the $HOME folder:

```sh
cd ~
git clone https://github.com/HofmannZ/.dotfiles.git
cd .dotfiles
```

Run the `install.sh` script list this:

```sh
./scripts/install.sh
```

In VS code press `Command + Shift + P` and search for install `code` in path.

Next, you can configure some extensions:

```sh
./scripts/setup_editor.sh
```

Then, run the gpg setup script providing the PGP fingerprint:

```sh
./scripts/setup_gpg.sh
```

That's it 🚀!

## Keep your system up to date

To update your system you can run the following command for anywhere:

```sh
sysup
```

## Flutter setup

1. Run: `sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer; sudo xcodebuild -runFirstLaunch; sudo xcodebuild -license`.

2. Run: `sudo gem install cocoapods`

3. Launch Android studio.

4. Install the SDK command-line tools.

5. Setup and AVD.

6. Run `flutter doctor --android-licenses`.

## Trouble shooting

If you get the following question on startup:

```
Ignore insecure directories and files and continue [y] or abort compinit [n]?
```

You shoud try to run:

```sh
compaudit | xargs chmod g-w
```

In case gems are out of date:

```
sudo gem update --system -n /usr/local/bin && sudo gem update -n /usr/local/bin
```
