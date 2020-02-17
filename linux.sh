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
  echo "已下載好iTerm2, 請到download執行安裝檔案 \n"
fi
echo "載入一個推薦iTerm2 scheme, 如果載入失敗請手動執行它 \n"
./Tomorrow_Night_Eighties.itermcolors
echo "現在請設定iTerm2, 點選右上角設定兩個東西 \n"
echo "iTerms > performerces > Profile > Report terminal type 選擇 xterm-256color \n"
echo "iTerms > performerces > Profile > Colors > Color Presets...選擇 Tomorrow Night Eighties \n"
echo "--------------------------------------- \n"

echo "檢查font-sourcecodepro-nerd-font是否安裝..."
which -s font-sourcecodepro-nerd-font
if [[ $? != 0 ]] ; then
  echo "尚未安裝font-sourcecodepro-nerd-font, 使用brew開始安裝..."
  brew tap homebrew/cask-fonts
  brew cask install font-sourcecodepro-nerd-font
  echo "請至 iTerm2 > Preferences > Profiles > Text > Font 設定選擇 SourceCodepro Nerd Font \n"
else
  echo "已經安裝font-sourcecodepro-nerd-font \n"
fi
echo "--------------------------------------- \n"

echo "檢查zsh是否安裝..."
which -s zsh
if [[ $? != 0 ]] ; then
  echo "尚未安裝zsh, 使用brew開始安裝..."
  brew install zsh
  sudo sh -c "echo $(which zsh) >> /etc/shells"
  chsh -s $(which zsh)
else
  echo "已經安裝zsh \n"
fi
echo "--------------------------------------- \n"

echo "檢查zsh-completions是否安裝..."
which -s zsh-completions
if [[ $? != 0 ]] ; then
  echo "尚未安裝zsh-completions, 使用brew開始安裝..."
  brew install zsh-completions
else
  echo "已經安裝zsh-completions \n"
fi
echo "--------------------------------------- \n"

echo "檢查oh-my-zsh是否安裝..."
which -s oh-my-zsh
if [[ $? != 0 ]] ; then
  echo "尚未安裝oh-my-zsh, 使用curl開始安裝..."
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "已經安裝oh-my-zsh \n"
fi
echo "--------------------------------------- \n"

echo "安裝zsh套件zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "安裝brew套件zsh-syntax-highlighting"
brew install zsh-syntax-highlighting
echo "拷貝.zshrc檔案到機台上, 會把機台上原本的./zshrc備份在此資料夾的linux_backup裡面 \n"
cp ~/.zshrc ./linux_backup
cp ./zshrc ~/.zshrc
exec $SHELL

echo "安裝 VScode..."
brew cask install visual-studio-code
echo "打開vscode後執行shift + command + p輸入shell執行install command 'code' in PATH"

exit 0
