#!/bin/bash
export PATH=/usr/sbin:/usr/bin:/bin:"${PATH}"

echo "檢查是否已創造SSH key..."
ls -al ~/.ssh
if [[ $? != 0 ]] ; then
  read -p "尚未創造SSH key, 準備開始建...請輸入e-mail:" email
  ssh-keygen -t rsa -b 4096 -C $email
else
  echo "已建立SSH key \n"
fi
echo "--------------------------------------- \n"

echo "檢查iTerm2是否安裝..."
which -s iterm2
if [[ $? != 0 ]] ; then
  echo "尚未安裝iterm2, 準備使用brew開始安裝..."
  brew cask install iterm2
else
  echo "已建立iTerm2 \n"
fi
echo "--------------------------------------- \n"

exit 0
