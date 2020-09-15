#!/bin/bash

cd stow
for s in *; do stow -t ~ $s; done
nvim +PlugInstall +qall
cd ../
