#!/bin/bash
# .bash_aliases

alias ll='ls -lh '
alias l.='ls -d .*'
alias ll.='ls -dlh '
alias grep='grep '
alias df='df -h'
alias du='\du -sh'
alias du.='\du -sh $(ls -d .*|grep -v ^.$|grep -v ^..$)'
alias path='echo $PATH | tr ":" "\n"'

alias cmacs='emacs -nw'
alias evil='emacs -f evil-mode'

if [[ "$(uname)" == 'Darwin' ]]; then
    alias ls='ls -G'
    # alias vpn-connect='scutil --nc start "VPN (Cisco IPSec)"'
    # alias vpn-disconnect='scutil --nc stop "VPN (Cisco IPSec)"'
    # open
    alias firefox='open -a/Applications/Firefox.app'
    alias safari='open -a /Applications/Safari.app'
    alias chrome='open -a /Applications/Google\ Chrome.app'
    alias slack='open -a /Applications/Slack.app'
    alias atom='open -a /Applications/Atom.app'
    alias sublime='open -a /Applications/Sublime\ Text.app'
    alias vscode='open -a /Applications/Visual\ Studio\ Code.app'
    alias f='open .'

elif [[ "$(uname)" == 'Linux' ]]; then
    alias ls='ls --color'
else
    :
fi
