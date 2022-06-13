# Dotfiles

## macOS

Update macOS and Install Xcode command line tools.

```sh
sudo softwareupdate -i -a
xcode-select --install
```

Install [homebrew](https://brew.sh).

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install [chezmoi](https://www.chezmoi.io).

```sh
brew install chezmoi
```

Init chezmoi.

```sh
chezmoi init paulofaria
```

Start yabai, skhd and spacebar.

```sh
brew services start yabai
brew services start skhd
brew services start sketchybar
```

