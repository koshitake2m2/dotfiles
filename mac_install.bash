#!/bin/bash
# install

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
    && eval "$(/opt/homebrew/bin/brew shellenv)" \
    && brew install cask \
    && brew install peco \
    && brew install vim \
    && brew install google-chrome \
    && brew install anyenv \
    && brew install visual-studio-code \
    && brew install docker \
    && brew install intellij-idea-ce  \
    && echo "homebrew done..."

# anyenv
# TODO: `exec $SHELL -l`で中断してしまうので要検討.
# NOTE: `$HOME/.config/anyenv/anyenv-install`が存在する場合, 以下のコマンドは通らない.
anyenv install --force-init \
    && eval "$(anyenv init -)" \
    && exec $SHELL -l
# TODO: 以下, 手入力.
anyenv install nodenv \
    && anyenv install pyenv \
    && exec $SHELL -l
# TODO: 以下, 手入力.
nodenv install 14.15.5 \
    && nodenv global 14.15.5 \
    && npm install -g yarn
pyenv install 3.9.1 \
    && pyenv global 3.9.1 \
    && exec $SHELL -l

