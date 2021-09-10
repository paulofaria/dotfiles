#!/bin/bash

# Install latest ruby                                                 
rbenv install 3.0.2 -s
rbenv global 3.0.2                                                    
rbenv rehash                                                          

# Install bundler                                                     
gem install bundler --conservative

# Install latest node LTS
source ~/.nvm/nvm.sh
nvm install --lts
nvm use --lts

# Install global node packages
npm install --global prettier
npm install --global eslint_d

