#!/bin/bash


if [[ "`uname -s`" == "Darwin" ]]; then
  echo -e "Mac OS, run $ ./mac_os.sh\n"
  chmod 760 mac_os.sh
  ./mac_os.sh
fi

if [[ "`uname -s`" == "Linux" ]]; then
  echo -e "Linux, run $ ./linux.sh\n"
  chmod 760 linux.sh
  ./linux.sh
fi
  
