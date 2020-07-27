# Dotfiles

Dotfiles to backup, restore, and sync my prefs and settings.

## How to use

Run the `install.sh` script list this:

```sh
./install.sh
```

The setup Keybase using providing chained proof. Once setup, find the public PGP fingerprint by running:

```sh
keybase pgp list
```

Then run the gpg setup scipt providing the PGP fingerprint:

```sh
./setup_gpg.sh 74432C545A2B88C97E7A02548EE0CAC87C95D82F
```

Yeah, thats my [public PGP fingerprint](https://keybase.io/hofmannz), check it out on Keybase.

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
