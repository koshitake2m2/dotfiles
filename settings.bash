#!/bin/bash
# settings

target_dirs="home"

backup_dir="$PWD/backup/$(date +"%Y%m%d_%H%M%S").bak"
mkdir -p ${backup_dir}

# 各ディレクトリのファイルをホームディレクトリに移す
# 対象のファイルが既に存在していたらバックアップをとる
for target_dir in ${target_dirs}; do
    echo "target : " ${target_dir}
    mkdir ${backup_dir}/${target_dir}
    for file in `ls -A ./${target_dir}`; do
        from=$PWD/${target_dir}/$file
        to=$HOME/$file
        if [[ -e $to ]]; then
            if [[ $(diff -r $from $to) == '' ]]; then
                continue
            fi
            mv $to ${backup_dir}/${target_dir}/
        fi
        cp -r $from $to
        echo $from " was copied";
    done
    if [[ ! -n $(ls -A ${backup_dir}/${target_dir}) ]]; then
        rm -rf ${backup_dir}/${target_dir}
    fi
done

if [[ ! -n $(ls -A ${backup_dir}) ]]; then
    echo No backup required...
    rm -rf ${backup_dir}
fi

# zshなら実行
if [[ $(basename $SHELL) = "zsh" \
    && -f ./only_zsh_settings.zsh ]]; then
    echo "";
    echo "source ./only_zsh_settings.zsh";
    source ./only_zsh_settings.zsh
fi

# nvim setting
mkdir -p $HOME/.config/nvim
touch init.vim
echo "source ~/.vimrc" > init.vim

