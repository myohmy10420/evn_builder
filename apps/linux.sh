#!/bin/bash

sudo apt-get update

list=("curl" "git" "zsh" "tmux" "imagemagick" "stow" "cmake" "ripgrep")
for app in "${list[@]}"
do
  echo "檢查 $app 是否安裝..."
  dpkg -s $app &> /dev/null
  if [ $? -ne 0 ]
  then
    echo "尚未安裝 $app, 準備開始安裝..."
    sudo apt-get install $app
  else
    echo "已安裝 $app"
  fi
done

echo "檢查 Neovim 是否下載..."
if [ ! -f ~/nvim.appimage ] ; then
  echo -e "尚未下載 Neovim, 準備開始下載..."
  curl -L -o ~/nvim.appimage https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x ~/nvim.appimage
else
  echo -e "已下載 Neovim"
fi

echo "檢查 Vundle 是否下載..."
[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle
if [ ! -d ~/.vim/bundle/Vundle.vim ] ; then
  echo -e "尚未下載 Vundel, 準備開始下載..."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
  echo -e "已下載 Vundle"
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

echo "檢查 asdf 是否下載..."
if [ ! -d ~/.asdf ]; then
  echo -e "尚未下載 asdf, 準備開始下載..."
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
else
  echo "已下載 asdf"
fi

echo "檢查 zsh-autosuggestions 是否下載..."
if [ ! -d ~/.zsh/zsh-autosuggestions ]; then
  echo -e "尚未下載 zsh-autosuggestions, 準備開始下載..."
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
else
  echo "已下載 zsh-autosuggestions"
fi

sudo usermod -s /usr/bin/zsh $(whoami)

exit 0
