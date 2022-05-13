#!/bin/bash
IGNORE_PATTERN="^\.(git|config|idea)"

# 未定義な変数があったら途中で終了する
set -u

# 今のディレクトリ
# dotfilesディレクトリに移動する
BASEDIR=$(dirname $0)
cd $BASEDIR

# dotfilesディレクトリにある、ドットから始まり2文字以上の名前のファイルに対して
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".gitmodules" ] && continue

    # シンボリックリンクを貼る
    ln -snfv ${PWD}/"$f" ~/
done


echo "\n========================"
echo "create .config in $HOME"
mkdir -p $HOME/.config
for dotfile in $(ls -F .config | grep -v /); do
    [[ $dotfile =~ $IGNORE_PATTERN ]] && continue
    ln -snfv "$(pwd)/.config/$dotfile" "$HOME/.config/$dotfile"
done

