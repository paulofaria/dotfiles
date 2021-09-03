#!/bin/bash

brew bundle --no-lock --file=/dev/stdin <<EOF
# Taps
tap "homebrew/cask-fonts"
tap "koekeishiya/formulae" # Yabai and friends
tap "cmacrae/formulae" # Spacebar
# CLI Apps
brew "git"
brew "tree"
brew "fzf"
brew "mas"
brew "rbenv"
brew "node"
brew "yabai"
brew "skhd"
brew "spacebar"
# Cask Apps
cask "kitty"
cask "ableton-live-suite"
# Cask Fonts
cask "font-fontawesome"
cask "font-jetbrains-mono-nerd-font"
# Mac App Store Apps
mas "Xcode", id: 497799835
EOF

# Install latest ruby
eval "$(rbenv init -)"
rbenv install $(rbenv install -l | grep -v - | tail -1) -s
rbenv global $(rbenv install -l | grep -v - | tail -1)
rbenv rehash

# Install bundler
gem install bundler --conservative

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh plugins
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


# Hide desktop icons
defaults write com.apple.finder CreateDesktop false

# Open folders in column view
defaults write com.apple.Finder FXPreferredViewStyle clmv 

# Open dock instantly
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -int 0

# Auto-hide menu bar and dock
osascript <<EOF
tell application "System Events"
tell dock preferences to set autohide menu bar to true
end tell

tell application "System Events" to set the autohide of the dock preferences to true
EOF

# Restart Finder and Dock
killall Finder
killall Dock

