# Dotfiles

Dotfiles to backup, restore, and sync my prefs and settings.

## How to use

Run the `install.sh` script list this:

```sh
./install.sh
```

That's it 🚀!

## Trouble shooting

If you get the following question on startup:

```
Ignore insecure directories and files and continue [y] or abort compinit [n]?
```

You shoud try to run:

```sh
compaudit | xargs chmod g-w
```
