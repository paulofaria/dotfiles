#!/bin/bash

brew bundle --no-lock --file=/dev/stdin <<EOF
# Taps
tap "homebrew/cask-fonts"
tap "jesseduffield/lazygit" # Lazygit
# CLI Apps
brew "bat"
brew "chezmoi"
brew "difftastic"
brew "fd"
brew "fzf"
brew "gh"
brew "git"
brew "git-delta"
brew "git-lfs"
brew "go"
brew "jq" 
brew "lazygit"
brew "mas"
brew "mosh"
brew "neovim"
brew "pnpm"
brew "postgresql"
brew "python"
brew "ripgrep"
brew "tmux"
brew "tree-sitter-cli"
brew "tree"
brew "xcbeautify"
brew "xcodebuildmcp"
brew "yazi"
brew "zoxide"
# Cask Apps
cask "finicky"
cask "ghostty"
cask "git-credential-manager"
cask "google-chrome"
cask "kaleidoscope"
cask "raycast"
cask "slack"
cask "whatsapp"
# Cask Fonts
cask "font-fontawesome"
cask "font-jetbrains-mono-nerd-font"
cask "sf-symbols"
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
