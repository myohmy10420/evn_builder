#!/bin/bash

TOOL_DIR=$(pwd)

cd "$TOOL_DIR/apps"
./index.sh
cd ../

cd "$TOOL_DIR/docfiles"
./index.sh
cd ../
