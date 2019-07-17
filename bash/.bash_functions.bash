#!/bin/bash
# bash function

function cd ()
{
    builtin cd "$@" && ls
}
function ba ()
{
    builtin cd - && ls
}
function mkcd ()
{
    mkdir -p "$@" && cd "$1"
}
function mkcd2 ()
{
    mkdir -p "$@" && cd "$_"
}
function lessn ()
{
    cat -n "$1" | less
}
function mkbak ()
{
    for target in "$@"; do
        cp -ir "$target" "$target".bak$(date +"%Y%m%d");
    done
}
function vix ()
{
    vim "$1" && chmod +x "$1";
}
function vir ()
{
    vim "$1" && chmod a+r "$1";
}
function compdf ()
{
    gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="$@";
}
function dic (){
    w3m "http://ejje.weblio.jp/content/$1"
}
function make_tex_pdf(){
    # $1 = input.md, $2 = output.md
    docker run -it --rm -v `pwd`:/workspace kumassy/alpine-pandoc-ja pandoc $1 -f markdown -o $2 --pdf-engine=lualatex
}


if [[ "$(uname)" == 'Darwin' ]]; then
    function cdf (){
        target=$(osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)')
        if [[ "$target" != "" ]]; then
            builtin cd "$target"; pwd; echo; ls
        else
            echo 'No Finder window found'
        fi
    }
    function chf(){
        if [[ $(defaults read com.apple.finder AppleShowAllFiles) = "FALSE" ]]; then
            defaults write com.apple.finder AppleShowAllFiles TRUE
            echo "Finder show all files"
        else
            defaults write com.apple.finder AppleShowAllFiles FALSE
            echo "Finder doesn't show dot files"
        fi
        killall Finder
    }
    function edit(){
        if [[ ! -f "$1" ]]; then touch "$1"; fi
        open -a TextEdit "$1"
    }
    OS='Mac'
elif [[ "$(uname)" == 'Linux' ]]; then
    OS='Linux'
else
    OS='Other'
fi
