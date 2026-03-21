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
