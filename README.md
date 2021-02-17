# README.md

自分用にbashやzsh等をセットアップします。主に設定ファイルをホームディレクトリ以下に置くスクリプトです。  

**以下をセットアップ**
- bash
- zsh
- vim
- docker


# Usage
```bash
## githubの設定を済ませてから
git clone https://github.com/koshitake2m2/my_setup.git
cd my_setup

# if you use linuxOS
bash settings.bash

# if you use macOS
zsh settings.bash prezto
zsh mac_install.bash
```

# その他共通セットアップ
以下、その他セットアップ

## github
```bash
# 秘密鍵のパス: $HOME/.ssh/id_rsa_github
ssh-keygen -t rsa -b 4096 -C "hello@sample.com" < <(echo $HOME/.ssh/id_rsa_github)

cat <<-EOF >> $HOME/.ssh/config
Host github
  HostName github.com
  IdentityFile ~/.ssh/id_rsa_github
  User git
EOF

ssh-add $HOME/.ssh/id_rsa_github
# githubに公開鍵を追加
cat .ssh/id_rsa_github.pub | pbcopy
ssh -T git@github.com

git config --global user.name "username"
git config --global user.email hello@sample.com

cat <<-EOF >> $HOME/.gitconfig
[url "github:"]
    InsteadOf = https://github.com/
    InsteadOf = git@github.com
EOF
```

# その他macセットアップ

## キーボード・トラックパッド・アクセシビリティ
- ライブ変換
- Fnキー
- 三本指ドラッグ
- キーリピート
- バックスラッシュ

## docker
$ open -a /Applications/Docker.app
サインイン

## ターミナル
シェルの終了時、正常終了でタブを閉じる
カラーはIcebergをデフォルトにする

## 各種インストール
- chrome
- slack

# 参考
以下、参考サイトです。

### git-prompt, git-completion
https://github.com/git/git/tree/master/contrib/completion (2019-7-17)  

