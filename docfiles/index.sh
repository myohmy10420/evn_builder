#!/bin/bash

TOOL_DOTFILES_DIR=$(pwd)

cd "$TOOL_DOTFILES_DIR/stow"
for s in *; do stow -t ~ $s; done

if ! grep -q "export EDITOR='~/nvim.appimage'" ~/.zshrc; then
  echo "export EDITOR='nvim'" >> ~/.zshrc
fi

if [[ "`uname -s`" == "Darwin" ]]; then
  nvim +PlugInstall +qall

  if ! grep -q "alias vi='nvim'" ~/.zshrc; then 
    echo "alias vi='nvim'" >> ~/.zshrc
  fi
fi

if [[ "`uname -s`" == "Linux" ]]; then
  ~/nvim.appimage +PlugInstall +qall

  if ! grep -q "alias vi='~/nvim.appimage'" ~/.zshrc; then 
    echo "alias vi='~/nvim.appimage'" >> ~/.zshrc
  fi
fi

bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

source ~/.asdf/asdf.sh
asdf plugin-add ruby    || true
asdf plugin-add rust    || true
asdf plugin-add nodejs  || true
asdf plugin-add python  || true
asdf plugin-add golang  || true
asdf install

pip install pynvim
pip2 install pynvim
pip3 install pynvim

chsh -s $(which zsh)

cd ../
