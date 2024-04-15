## chezmoi 抓 dotfile 檔案

```
$ chezmoi cd
$ chezmoi init --apply https://github.com/myohmy10420/dotfiles.git
```

## 安裝 node

記得先安裝 node 不然 nvim 的 lsp 幾乎都不能安裝

參考版本 v21.7.1

## 安裝 rvm

要安裝 openssl@1.1

m1 開始很容易遇到底層 C 語言等的編譯問題，例如之前有遇到錯誤訊息 Error running '__rvm_make -j8

參考[這篇](https://github.com/rvm/rvm/issues/5404#issuecomment-1806701326)

安裝指定版本的範例

```
$ rvm install 3.2.2 --with-openssl-dir=$(brew --prefix openssl@1.1)
$ rvm install 2.7.7 --with-openssl-dir=$(brew --prefix openssl@1.1)
```

## 安裝 languageclient-neovim

solargraph 官網說要安裝 languageclient-neovim，等 vim 抓(安裝)完 plugin 後要手動安裝

```
$ cd ~/.local/share/nvim/site/pack/packer/start/languageclient-neovim
$ bash install.sh
```

如果遇到 No pre-built binary available for Darwin arm64. 訊息可以參考[這篇](https://github.com/autozimu/LanguageClient-neovim/issues/1236#issuecomment-1176742436)，就是安裝rust：

```
$ brew install rust
$ cargo build --release
$ bash install.sh
```

## 安裝 vim-tmux-navigator

以下三個應該都已經近 chezmoi 版控

- .config/nvim
- .tmux/plugins/tpm/ (tmux plugins manager)
- .tmux.conf

nvim 安裝完後，打開 .tmux.config 執行 prefix + I 安裝套件，會自動 source tmux，應該就可以用了

手動 source tmux config 的指令如下：

```
$ tmux source ~/.tmux.conf
```

## 快速 gem SSH key 並使用

```
$ ssh-keygen -t rsa -b 4096
$ ssh-add ~/.ssh/id_rsa
```

ssh key 加到 github 的話可以在專案底下測試連線

```
$ ssh -T git@github.com
$ ssh -T git@gitlab.com:username/project.git
```
