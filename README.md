僅支援 mac 先行安裝一些常用工具

## 使用
1. git clone https://github.com/myohmy10420/evn_builder ~/evn_builder
2. cd ~/evn_builder
3. ./index.sh
4. 全部安裝完後重開 shell(or re-login your server)
5. vi 隨便一隻檔案(應該會用 Neovim 開啟), :PluginInstall
6. python3 ~/.vim/bundle/YouCompleteMe/install.py --all 安裝 vim ymc

## 安裝完後記得引入 dotfiles
1. chezmoi init https://github.com/myohmy10420/dotfiles.git
2. chezmoi apply
