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
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "已安裝Homebrew"
fi

list=("curl" "git" "zsh" "neovim" "tmux" "chezmoi" "lazygit" "ripgrep" "gnupg" "zsh-autosuggestions" "fzf" "fd" "eza" "bat" "htop" "jq")
apps=""

for app in "${list[@]}"; do
  echo "檢查 $app 是否安裝..."
  if ! brew list "$app" &>/dev/null; then
    echo -e "\033[33m尚未安裝 $app, 等候安裝...\033[0m"
    apps="$apps $app"
  else
    echo -e "\033[32m已安裝 $app\033[0m"
  fi
done

if [ -z "$apps" ] ; then
  echo -e "沒有東西需要 Homebrew 安裝了"
else
  echo -e "Homebrew 準備開始安裝$apps ..."
  brew install $apps
fi

if brew list --formula | grep -q '^zsh$'; then
  brew_zsh="$(brew --prefix)/bin/zsh"
  if [ -f "$brew_zsh" ] && ! grep -q "$brew_zsh" /etc/shells; then
    echo "Adding brew zsh to /etc/shells..."
    echo "$brew_zsh" | sudo tee -a /etc/shells
  fi
  echo "設定 brew zsh 為預設 shell..."
  chsh -s "$brew_zsh"
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

exit 0
