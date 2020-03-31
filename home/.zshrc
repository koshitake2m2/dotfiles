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


# --- $B%3%^%s%IMzNr(B ---
# $BMzNr%U%!%$%k$NJ]B8@h(B
export HISTFILE=${HOME}/.zsh_history

# $B%a%b%j$KJ]B8$5$l$kMzNr$N7o?t(B
export HISTSIZE=1000

# $BMzNr%U%!%$%k$KJ]B8$5$l$kMzNr$N7o?t(B
export SAVEHIST=100000

# $B=EJ#$r5-O?$7$J$$(B
setopt hist_ignore_dups

# $BB>C<Kv$HMzNr$r6&M-(B
setopt share_history

# $B3+;O$H=*N;$r5-O?(B
setopt EXTENDED_HISTORY
# --- end $B%3%^%s%IMzNr(B ---

# ---  $B%3%^%s%IMzNr(B peco ---
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
# --- end $B%3%^%s%IMzNr(B peco ---

# --- $B$=$NB>(B ---
# $BA4%3%^%s%I$G(B correct $B5!G=$rL58z2=(B
unsetopt correctall
unsetopt correct
# --- end $B$=$NB>(B ---
#
echo "read .zshrc"
