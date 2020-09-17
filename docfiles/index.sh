#!/bin/bash

cd stow
for s in *; do stow -t ~ $s; done

if [[ "`uname -s`" == "Darwin" ]]; then
  nvim +PlugInstall +qall
  echo "export EDITOR='nvim'" >> ~/.zshrc
  echo "alias vi='nvim'" >> ~/.zshrc
fi

if [[ "`uname -s`" == "Linux" ]]; then
  ~/nvim.appimage +PlugInstall +qall
  echo "export EDITOR='~/nvim.appimage'" >> ~/.zshrc
  echo "alias vi='~/nvim.appimage'" >> ~/.zshrc
fi

cd ../
