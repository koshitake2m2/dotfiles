# .bashrc

# Source global definitions
if [[ -f /etc/bashrc ]]; then
	. /etc/bashrc
fi

# Source .bash_aliases.bash
if [[ -f ~/.bash_aliases.bash ]]; then
	. ~/.bash_aliases.bash
fi

# Source .bash_functions.bash
if [[ -f ~/.bash_functions.bash ]]; then
	. ~/.bash_functions.bash
fi

# Source git-completion
if [[ $(basename $SHELL) = "bash" \
    && -f ~/.git-completion.bash ]]; then
	. ~/.git-completion.bash
fi

# Source git-prompt
if [[ $(basename $SHELL) = "bash" \
    && -f ~/.git-prompt.sh ]]; then
	. ~/.git-prompt.sh
    export PS1='\n\[\e[33m\]\w \[\e[31m\]$(__git_ps1)\[\e[0m\]\n> '
    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWUNTRACKEDFILES=true
    GIT_PS1_SHOWSTASHSTATE=true
    GIT_PS1_SHOWUPSTREAM=auto
fi


# umask 077
umask 077

# expand_aliases
shopt -s expand_aliases

# Source .bash_local_settings.bash
if [[ -f ~/.bash_local_settings.bash ]]; then
	. ~/.bash_local_settings.bash
fi

echo "read .bashrc"
