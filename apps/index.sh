#!/bin/bash

TOOL_APP_DIR=$(dirname "$0")

if [[ "`uname -s`" == "Darwin" ]]; then
  echo -e "Mac OS, run $ ./mac_os.sh\n"
  chmod 760 $TOOL_APP_DIR/mac_os.sh
  $TOOL_APP_DIR/mac_os.sh
fi
