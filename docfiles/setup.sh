#!/bin/bash

if [[ "`uname -s`" == "Darwin" ]]; then
  echo -e "macOS \n"

  echo -e "Install Homebrew \n"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  rake
  rake install
elif [[ "`uname -s`" == "Linux" && "`uname -m`" == "x86_64" ]]; then
  echo -e "Linux x86_64 \n"

  echo -e "Update apt-get \n"
  sudo apt-get update

  echo -e "Install Homebrew \n"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  echo -e "Set Homebrew path \n"
  test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
  test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
  echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

  echo -e "Install ruby \n"
  brew install ruby

  rake
  rake install
else
  echo -e "Invalid system."
fi
