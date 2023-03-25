# README.md

自分用にbashやzsh等をセットアップします。主に設定ファイルをホームディレクトリ以下に置くスクリプトです。  

# Usage
```bash
## githubの設定を済ませてから
git clone https://github.com/koshitake2m2/dotfiles.git
cd dotfiles

# if you use linuxOS
bash settings.bash

# if you use macOS
zsh settings.bash prezto
# zsh mac_install.bash # 調整中のためこのファイルを見ながら手動でインストール…
```

# その他共通セットアップ
以下、その他セットアップ

## github
```bash
user_name="hello"
mail_address="hello@sample.com"

# 秘密鍵のパス: $HOME/.ssh/id_rsa_github
ssh-keygen -t rsa -b 4096 -C $mail_address < <(echo $HOME/.ssh/id_rsa_github)

cat <<-EOF > $HOME/.ssh/config
Host github
  HostName github.com
  IdentityFile ~/.ssh/id_rsa_github
  User git
EOF

ssh-add $HOME/.ssh/id_rsa_github
# githubに公開鍵を追加
cat .ssh/id_rsa_github.pub | pbcopy


ssh -T git@github.com

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

# その他macセットアップ

## キーボード・トラックパッド・アクセシビリティ
- キーボード
  - 地球儀キーを押して何もしない
- Fnキー
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

## Dockとメニューバー
- 「画面上の位置」を左にチェック
- 「Dockを自動的に表示/非表示」をチェック
- 「キーボードの輝度」をオフ
- 「Bluetooth」をメニューバーに表示
- 「バッテリー」の割合(%)を表示

## Finderの設定

```bash
# .DS_Storeを生成しない.
defaults write com.apple.desktopservices DSDontWriteNetworkStores True
# 隠しファイルを表示するようにする.
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder
```


## docker
1. https://docs.docker.com/desktop/mac/install/ からインストール
2. 開いてサインイン

## ターミナル
- シェルの終了時、正常終了でタブを閉じる
- Icebergをcloneしてファイルを開く. それからカラーをデフォルトにする
  - Iceberg: https://gist.github.com/cocopon/a04be63f5e0856daa594702299c13160 (2019-7-17)

```bash
git clone https://gist.github.com/a04be63f5e0856daa594702299c13160.git
```

## 各種インストール
- chrome
- slack

# 参考
以下、参考サイトです。

### git-prompt, git-completion
https://github.com/git/git/tree/master/contrib/completion (2019-7-17)  

