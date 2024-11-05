# README.md

自分用に bash や zsh 等をセットアップします。主に設定ファイルをホームディレクトリ以下に置くスクリプトです。

# Usage

```bash
## githubの設定を済ませてから
git clone https://github.com/koshitake2m2/dotfiles.git
cd dotfiles

# if you use linuxOS
bash settings.bash

# if you use macOS
zsh settings.bash prezto

# 調整中のためこのファイルを見ながら手動でインストール…
# zsh mac_install.bash
```

# その他共通セットアップ

以下、その他セットアップ

## github

```bash
# 1. Set local vars.
user_name="hello"
mail_address="hello@sample.com"

# 2.
## 秘密鍵のパス: $HOME/.ssh/id_rsa_github
ssh-keygen -t rsa -b 4096 -C $mail_address < <(echo $HOME/.ssh/id_rsa_github)

cat <<-EOF > $HOME/.ssh/config
Host github
  HostName github.com
  IdentityFile ~/.ssh/id_rsa_github
  User git
EOF

ssh-add $HOME/.ssh/id_rsa_github
cat .ssh/id_rsa_github.pub | pbcopy


# 3. githubに公開鍵を追加

# 4.
ssh -T git@github.com

# 5.
git config --global user.name $user_name
git config --global user.email $mail_address
git config --global pull.rebase false
git config --global push.default current

cat <<-EOF >> $HOME/.gitconfig
[url "github:"]
    InsteadOf = https://github.com/
    InsteadOf = git@github.com
EOF
```

# その他 mac セットアップ

## キーボード・トラックパッド・アクセシビリティ

- キーボード
  - 地球儀キーを押して何もしない
- Fn キー
- 三本指ドラッグ
- キーリピート
- バックスラッシュ
- 入力ソース
  - 日本語 - ローマ字入力
    - 有効: 入力モードの英字
    - 無効: ライブ変換, タイプミス修正, 句読点で変換
  - ABC: 削除

## Mission Control

- 「最新の使用状況に基づいて操作スペースを自動的に並び替える」のチェックを外す

## Dock とメニューバー

- 「画面上の位置」を左にチェック
- 「Dock を自動的に表示/非表示」をチェック
- 「キーボードの輝度」をオフ
- 「Bluetooth」をメニューバーに表示
- 「バッテリー」の割合(%)を表示

## Finder の設定

```bash
# .DS_Storeを生成しない.
defaults write com.apple.desktopservices DSDontWriteNetworkStores True
# 隠しファイルを表示するようにする.
defaults write com.apple.finder AppleShowAllFiles TRUE
# 連続入力
defaults write -g ApplePressAndHoldEnabled -bool false

killall Finder
# 他のアプリに反映させれてなかったらそのアプリを再起動しよう
```

## docker

1. https://docs.docker.com/desktop/mac/install/ からインストール
2. 開いてサインイン

## ターミナル

- シェルの終了時、正常終了でタブを閉じる
- Iceberg を clone してファイルを開く. それからカラーをデフォルトにする
  - Iceberg
    - https://gist.github.com/cocopon/a04be63f5e0856daa594702299c13160 (2019-7-17)
    - https://github.com/Arc0re/Iceberg-iTerm2.git
  - official: https://github.com/cocopon/iceberg.vim

```bash
cd tmp
git clone https://gist.github.com/a04be63f5e0856daa594702299c13160.git
git clone https://github.com/Arc0re/Iceberg-iTerm2.git
```

## 各種インストール

- chrome
- slack

# 参考

以下、参考サイトです。

### git-prompt, git-completion

https://github.com/git/git/tree/master/contrib/completion (2019-7-17)
