#!/bin/bash

brew bundle --no-lock --file=/dev/stdin <<EOF
# CLI Apps
brew "git"
brew "mas"
brew "rbenv"
brew "node"
# Cask Apps
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
