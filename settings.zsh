#!/bin/zsh
# settings

target_dirs="home"
#target_dirs="${target_dirs} bash"
#target_dirs="${target_dirs} zsh"
#target_dirs="${target_dirs} vim"

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
    echo remove ${backup_dir}
    rm -rf ${backup_dir}
fi

# Source Prezto.
# zsh uncomment
if [[ $1 == 'prezto' ]]; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
fi

