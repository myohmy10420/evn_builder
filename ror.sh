#!/bin/bash

echo "安裝 Ruby on Rails 開發環境..."

list=("rbenv" "imagemagick")
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

# 設定 rbenv
if [ "$(command -v rbenv)" ] ; then
  echo "設定 rbenv..."
  if ! grep -q 'rbenv init' ~/.zshrc; then
    echo 'eval "$(rbenv init -)"' >> ~/.zshrc
    echo -e "\033[32m已將 rbenv init 加入 ~/.zshrc\033[0m"
  fi
  echo "請執行 'source ~/.zshrc' 或重新啟動終端機以使 rbenv 生效"
  echo "之後可以使用 'rbenv install 3.x.x' 安裝 Ruby 版本"
  echo "使用 'rbenv global 3.x.x' 設定全域 Ruby 版本"
fi

exit 0
