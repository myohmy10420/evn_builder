#!/bin/bash

# echo "The script you are running has basename `basename "$0"`, dirname `dirname "$0"`"
# echo "The present working directory is `pwd`"

TOOL_DIR=$(dirname "$0")
$TOOL_DIR/apps/index.sh
