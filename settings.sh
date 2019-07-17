#!/bin/bash
# OSのセットアップ

function getOS() {
    if [[ "$(uname)" == 'Darwin' ]]; then
        OS='Mac'
    elif [[ "$(uname)" == 'Linux' ]]; then
        OS='Linux'
    else
        OS='Other'
    fi
    echo ${OS};
}

if [[ "`getOS`" == "Mac" ]]; then
    echo "`getOS`";
fi

target_dirs=""
target_dirs="${target_dirs} bash"
target_dirs="${target_dirs} zsh"
target_dirs="${target_dirs} vim"

for target_dir in ${target_dirs}; do
    echo "target : " ${target_dir}
#    echo "ls -d ./${target_dir}/.* : `ls -G -d ${target_dir}/.*`"
    for file in `ls -A ./${target_dir}`; do
        echo $PWD/${target_dir}/$file;
        move=$PWD/${target_dir}/$file
        to=$HOME/$file
        if [[ -e to ]]; then
            echo mv $to $PWD/backup
        fi
        echo cp -r $move $to
    done
done
