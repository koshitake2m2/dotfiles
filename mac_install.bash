#!/bin/bash
# install

# xcode
xcode-select --install

# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" \
    && brew install cask \
    && brew install peco \
    && brew cask install visual-studio-code \
#    && brew cask install docker \
    && echo "homebrew done..."

# nodebrew
brew install nodebrew \
    && nodebrew setup \
    && nodebrew install-binary stable \
    && nodebrew use stable \
    && echo "nodebrew done..."
