#!/bin/bash

cd stow
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

chsh -s $(which zsh)

cd ../
