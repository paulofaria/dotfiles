# Dotfiles

## macOS

Update macOS and install Xcode command line tools.

```sh
sudo softwareupdate -i -a
xcode-select --install
```

Install [Homebrew](https://brew.sh).

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install [chezmoi](https://www.chezmoi.io).

```sh
brew install chezmoi
```

Initialize chezmoi with the default source directory.

```sh
chezmoi init paulofaria
```

Preview managed file changes first.

```sh
chezmoi status --exclude=scripts
chezmoi diff --exclude=scripts
```

Apply managed files without running install scripts.

```sh
chezmoi apply --exclude=scripts
```

Run the full apply when you intentionally want bootstrap scripts too.

```sh
chezmoi apply
```

Useful commands.

```sh
chezmoi doctor --no-network
chezmoi update
chezmoi cd
```

## Mail

Tracked mail configuration:

- `~/.mbsyncrc`
- `~/.notmuch-config`
- `~/.config/himalaya/config.toml`

Mail tools in the bootstrap script:

- `isync` (`mbsync`)
- `notmuch`
- `himalaya`

Required macOS Keychain items:

- `mbsync-icloud`
- `icloud-smtp-passwd`

Example commands:

```sh
security add-generic-password -U -a "REDACTED_ICLOUD_USER" -s "mbsync-icloud" -w "***"
security add-generic-password -U -a "icloud" -s "icloud-smtp-passwd" -w "***"
```

Local mail state is intentionally not tracked:

- `~/.Mail/`
- notmuch database contents
- downloaded attachments

Useful mail commands:

```sh
mbsync icloud
notmuch new
himalaya folder list --account icloud
```
