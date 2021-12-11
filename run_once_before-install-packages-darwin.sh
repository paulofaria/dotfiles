#!/bin/bash

brew bundle --no-lock --file=/dev/stdin <<EOF
# Taps
tap "homebrew/cask-fonts"
tap "koekeishiya/formulae" # Yabai and friends
tap "cmacrae/formulae" # Spacebar
tap "jesseduffield/lazygit" # Lazygit
# CLI Apps
brew "git"
brew "gh"
brew "bat"
brew "tree"
brew "fzf"
brew "fd"
brew "ripgrep"
brew "jesseduffield/lazygit/lazygit"
brew "go"
brew "neovim"
brew "mas"
brew "rbenv"
brew "yabai"
brew "skhd"
brew "spacebar"
brew "yarn"
# Cask Apps
cask "kitty"
cask "alfred"
cask "slack"
cask "google-chrome"
# Cask Fonts
cask "font-fontawesome"
cask "font-jetbrains-mono-nerd-font"
# Mac App Store Apps
# mas "Xcode", id: 497799835
EOF

# Install fzf key bindings and fuzzy completion
$(brew --prefix)/opt/fzf/install

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh plugins
git clone --depth=1 https://github.com/romkatv/powerlevel10k ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone --depth=1 https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab


# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | zsh 

# Install lvim
LVBRANCH=rolling bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)

