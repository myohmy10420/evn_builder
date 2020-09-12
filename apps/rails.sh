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

echo "檢查gpg2是否安裝..."
which -s gpg2
if [[ $? != 0 ]] ; then
  echo "尚未安裝gpg2, 準備使用brew開始安裝..."
  brew install gpg2
else
  echo "已安裝gpg2 \n"
fi
echo "--------------------------------------- \n"

echo "檢查curl是否安裝..."
which -s curl
if [[ $? != 0 ]] ; then
  echo "尚未安裝curl, 準備使用brew開始安裝..."
  brew install curl
else
  echo "已安裝curl \n"
fi
echo "--------------------------------------- \n"

echo "檢查rvm是否安裝..."
which -s rvm
if [[ $? != 0 ]] ; then
  echo "尚未安裝rvm, 準備使用curl開始安裝... \n"
  echo "先利用gpg匯入官方金鑰, 準備執行: \n"
  echo "gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB \n"
  echo "上行等同於官方網站的 \n"
  echo "gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB \n"
  echo "原因請參考: https://stackoverflow.com/questions/54391696/gpg2-command-not-found-even-when-gpg2-is-installed-on-mac-trying-to-install-rv \n"
  echo "執行匯入官方金鑰中..."
  gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3                   7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  echo "使用curl開始安裝..."
  \curl -sSL https://get.rvm.io | bash -s stable
  source ~/.rvm/scripts/rvm
else
  echo "已安裝rvm \n"
fi
echo "--------------------------------------- \n"

echo "安裝結束, 現在請使用rvm安裝自己所需的ruby版本, 並且使用指令$ gem install rails -v x.x.x安裝自己所需版本 \n"

exit 0
