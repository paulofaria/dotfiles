#!/bin/bash

# Install latest node LTS
source ~/.nvm/nvm.sh
nvm install --lts
nvm use --lts

# Install global JS tooling
pnpm add --global prettier eslint_d
