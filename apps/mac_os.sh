#!/bin/bash

echo "檢查Command Line Tools(xcode-select)是否安裝..."
if ! [ "$(command -v xcode-select)" ] ; then
  echo "尚未安裝xcode-select, 準備開始安裝..."
  xcode-select --install
else
  echo "已安裝xcode-select"
fi

echo "檢查Homebrew是否安裝..."
if ! [ "$(command -v brew)" ] ; then
  echo "尚未安裝Homebrew, 準備開始安裝..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "已安裝Homebrew"
fi

list=("curl" "git" "asdf" "zsh" "nvim" "tmux")
apps=""
for app in "${list[@]}"
do
  echo "檢查 $app 是否安裝..."
  if ! [ "$(command -v $app)" ] ; then
    echo "尚未安裝 $app, 等候安裝..."
    apps="$apps $app"
  else
    echo "已安裝 $app"
  fi
done

echo "檢查imagemagick(convert)是否安裝..."
if ! [ "$(command -v convert)" ] ; then
  apps="$apps imagemagick"
else
  echo "已安裝imagemagick"
fi

if [ -z "$var" ] ; then
  echo -e "沒有東西需要 Homebrew 安裝了"
else
  echo -e "Homebrew 準備開始安裝$apps ..."
  brew install $apps
fi

echo "檢查Vundle 是否下載..."
[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle
if [ ! -d ~/.vim/bundle/Vundle.vim ] ; then
  echo -e "尚未下載 Vundel, 準備開始下載..."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
  echo -e "已下載 Vundle"
fi

exit 0
