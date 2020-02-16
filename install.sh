#!/bin/bash
export PATH=/usr/sbin:/usr/bin:/bin:"${PATH}"

echo "檢查Homebrew... \n"
which -s brew
if [[ $? != 0 ]] ; then
  echo "尚未安裝Homebrew, 準備開始安裝..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "已安裝Homebrew, 準備開始更新..."
  brew update
fi

exit 0
