#!/bin/bash
# install

# homebrew
# TODO: インストールに失敗したアプリをリストアップするように検討.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
    && eval "$(/usr/local/bin/brew shellenv)"

# brew bundle 経由の場合
# NOTE: `brew bundle dump` でBrewfileをdumpできる
brew bundle --file=Brewfile_work
# cs setup # bundleでインストールする場合

# brew install手作業の場合
brew install cask
brew install peco
brew install vim
brew install neovim
brew install google-chrome
brew install vivaldi
brew install slack
brew install anyenv
brew install visual-studio-code
brew install docker
brew install intellij-idea-ce
brew tap homebrew/cask-versions
brew install adoptopenjdk8
brew install discord
brew install raycast
brew install iterm2
brew install coursier/formulas/coursier && cs setup

echo "homebrew done..."

# anyenv
# TODO: `exec $SHELL -l`で中断してしまうので要検討.
# NOTE: `$HOME/.config/anyenv/anyenv-install`が存在する場合, 以下のコマンドは通らない.
anyenv install --force-init \
    && eval "$(anyenv init -)" \
    && exec $SHELL -l
cat <<EOF
# TODO: 以下, 手入力.
anyenv install pyenv \
    && anyenv install jenv \
    && anyenv install rbenv \
    && exec $SHELL -l
# TODO: 以下, 手入力.
jenv add $(/usr/libexec/java_home -v "1.8")
jenv add /Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
jenv global corretto64-1.8.0.332

# TODO: replace nodenv to volta
nodenv install 14.15.5 \
    && nodenv global 14.15.5 \
    && npm install -g yarn
pyenv install 3.9.1 \
    && pyenv global 3.9.1 \
    && exec $SHELL -l
EOF

