#!/bin/zsh
# .zshrc
#
# Executes commands at the start of an interactive session.
#
# Inherited zsh settings...
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
#
# $ git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
# $ setopt EXTENDED_GLOB
# for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
#   ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
# done
# 
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source .zsh_local_settings.zsh
if [[ -f ~/.zsh_local_settings.zsh ]]; then
	source ~/.zsh_local_settings.zsh
fi

# Source .bash_local_settings.bash
if [[ -f ~/.bash_local_settings.bash ]]; then
	source ~/.bash_local_settings.bash
fi

# Source .bash_aliases.bash
if [[ -f ~/.bash_aliases.bash ]]; then
	source ~/.bash_aliases.bash
fi

# Source .bash_functions.bash
if [[ -f ~/.bash_functions.bash ]]; then
	source ~/.bash_functions.bash
fi


# prompt
precmd() {
  print -P -n '\n${(r:($COLUMNS)::-:)}'
}

# PROMPT=$'left'
# RPROMPT=$'right'

# Customize to your needs...

# umask 077
umask 077


# --- コマンド履歴 ---
# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 他端末と履歴を共有
setopt share_history

# 開始と終了を記録
setopt EXTENDED_HISTORY
# --- end コマンド履歴 ---

# ---  コマンド履歴 peco ---
# brew install peco
# usage: 
# ctrl + r: show history
# ctrl + p: previous
# ctrl + n: next
# esc     : exit
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection
# --- end コマンド履歴 peco ---

# --- その他 ---
# 全コマンドで correct 機能を無効化
unsetopt correctall
unsetopt correct
# --- end その他 ---
#
echo "read .zshrc"
