#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source .zsh_local_settings.zsh
if [[ -f ~/.zsh_local_settings.zsh ]]; then
	source ~/.zsh_local_settings.zsh
fi

# Source .bash_aliases.bash
if [[ -f ~/.bash_aliases.bash ]]; then
	. ~/.bash_aliases.bash
fi

# Source .bash_functions.bash
if [[ -f ~/.bash_functions.bash ]]; then
	. ~/.bash_functions.bash
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

function make_tex_pdf(){
    # $1 = input.md, $2 = output.md
    docker run -it --rm -v `pwd`:/workspace kumassy/alpine-pandoc-ja pandoc $1 -f markdown -o $2 --pdf-engine=lualatex
}

# 履歴
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

function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

echo "read .zshrc"
