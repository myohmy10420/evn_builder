僅支援 mac 先行安裝一些常用工具

## 使用
1. git clone https://github.com/myohmy10420/evn_builder ~/evn_builder
2. cd ~/evn_builder
3. ./index.sh
4. 全部安裝完後重開 shell(or re-login your server)

## 安裝完後記得引入 dotfiles
1. chezmoi init https://github.com/myohmy10420/dotfiles.git
2. chezmoi apply
