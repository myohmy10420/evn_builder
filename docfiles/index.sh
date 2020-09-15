#!/bin/bash

stow --verbose git \
  zsh \
  nvim \
  tmux \
  ruby \
  asdf

nvim +PlugInstall +qall
