#!/bin/bash

stow --verbose git \
  zsh \
  nvim \

nvim +PlugInstall +qall
