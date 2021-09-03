#!/bin/bash

brew bundle --no-lock --file=/dev/stdin <<EOF
# Taps
tap "koekeishiya/formulae" # Yabai and friends
tap "cmacrae/formulae" # Spacebar
# CLI Apps
brew "git"
brew "tree"
brew "mas"
brew "rbenv"
brew "node"
brew "yabai"
brew "skhd"
brew "spacebar"
# Cask Apps
cask "kitty"
cask "ableton-live-suite"
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

# Hide desktop icons
defaults write com.apple.finder CreateDesktop false

# Auto-hide menu bar
osascript <<EOF
tell application "System Events"
tell dock preferences to set autohide menu bar to true
end tell
EOF

