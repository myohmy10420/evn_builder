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

list=("curl" "git" "zsh" "nvim" "tmux" "chezmoi")
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

echo "檢查ripgrep(rg)是否安裝..."
if ! [ "$(command -v rg)" ] ; then
  apps="$apps ripgrep"
else
  echo "已安裝ripgrep(rg)"
fi

echo "檢查imagemagick(convert)是否安裝..."
if ! [ "$(command -v convert)" ] ; then
  apps="$apps imagemagick"
else
  echo "已安裝imagemagick"
fi

echo "檢查gnupg(gpg)是否安裝..."
if ! [ "$(command -v gpg)" ] ; then
  apps="$apps gnupg"
else
  echo "已安裝gnupg(gpg)"
fi

if [ -z $apps ] ; then
  echo -e "沒有東西需要 Homebrew 安裝了"
else
  echo -e "Homebrew 準備開始安裝$apps ..."
  brew install $apps
fi

echo "檢查 powerlevel10k 是否下載..."
# 有任何字型問題可以參考
# https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k
if [ ! -d ~/powerlevel10k ] ; then
  echo -e "尚未下載 powerlevel10k, 準備開始下載..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
else
  echo -e "已下載 powerlevel10k"
fi
echo -e "$ p10k configure 可以對 powerlevel10k 再次做設定"

echo "檢查 zsh-autosuggestions 是否下載..."
if [ ! -d ~/.zsh/zsh-autosuggestions ]; then
  echo -e "尚未下載 zsh-autosuggestions, 準備開始下載..."
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
else
  echo "已下載 zsh-autosuggestions"
fi

echo "檢查rvm是否安裝..."
if ! [ "$(command -v rvm)" ] ; then
  gpg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  \curl -sSL https://get.rvm.io | bash -s stable
else
  echo "已安裝rvm"
fi

exit 0
