#!/bin/bash
export PATH=/usr/sbin:/usr/bin:/bin:"${PATH}"

echo "此安裝檔適用於已經安裝好xcode的Mac or Linux系統, 請確認是否符合條件 \n"
read -p "輸入 Y 為已確認:"  confirm_installed_xcode
if [[ $confirm_installed_xcode != 'Y' ]] ; then
  echo "尚未符合條件, 結束安裝"
  exit 0
fi
echo "--------------------------------------- \n"

echo "檢查Command Line Tools(xcode-select)是否安裝..."
which -s xcode-select
if [[ $? != 0 ]] ; then
  echo "尚未安裝xcode-select, 準備開始安裝..."
  xcode-select --install
else
  echo "已安裝xcode-select \n"
fi
echo "--------------------------------------- \n"

echo "檢查Homebrew是否安裝..."
which -s brew
if [[ $? != 0 ]] ; then
  echo "尚未安裝Homebrew, 準備開始安裝..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "已安裝Homebrew, 準備開始更新..."
  brew update
fi
echo "--------------------------------------- \n"

echo "檢查git是否安裝..."
which -s git
if [[ $? != 0 ]] ; then
  echo "尚未安裝git, 準備使用brew開始安裝..."
  brew install git
else
  echo "已安裝git \n"
fi
echo "--------------------------------------- \n"

echo "檢查imagemagick(convert)是否安裝..."
which -s convert
if [[ $? != 0 ]] ; then
  echo "尚未安裝imagemagick, 準備使用brew開始安裝..."
  brew install imagemagick
else
  echo "已安裝imagemagick \n"
fi
echo "--------------------------------------- \n"

exit 0
