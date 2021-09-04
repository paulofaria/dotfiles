#!/bin/bash

brew bundle --no-lock --file=/dev/stdin <<EOF
# Taps
tap "homebrew/cask-fonts"
tap "koekeishiya/formulae" # Yabai and friends
tap "cmacrae/formulae" # Spacebar
# CLI Apps
brew "git"
brew "bat"
brew "tree"
brew "fzf"
brew "mas"
brew "rbenv"
brew "yabai"
brew "skhd"
brew "spacebar"
# Cask Apps
cask "kitty"
# Cask Fonts
cask "font-fontawesome"
cask "font-jetbrains-mono-nerd-font"
# Mac App Store Apps
mas "Xcode", id: 497799835
EOF

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh plugins
git clone --depth=1 https://github.com/romkatv/powerlevel10k ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | zsh 

