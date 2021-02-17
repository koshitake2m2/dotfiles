#!/bin/bash
# install

# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" \
    && brew install cask \
    && brew install peco \
    && brew install vim \
    && brew install anyenv \
    && brew install visual-studio-code \
    && brew install docker \
    && brew install intellij-idea-ce  \
    && echo "homebrew done..."

# anyenv
anyenv install --force-init \
    && eval "$(anyenv init -)"
    && exec $SHELL -l
    && anyenv install nodenv
    && exec $SHELL -l
    && nodenv install 14.15.5
    && nodenv global 14.15.5
    && anyenv install pyenv
    && exec $SHELL -l
    && pyenv install 3.9.1
    && pyenv global 3.9.1
