#!/bin/bash

TOOL_APP_DIR=$(dirname "$0")

if [[ "`uname -s`" == "Darwin" ]]; then
  echo "歡迎使用 macOS 開發環境安裝工具"
  echo "您可以選擇要安裝的環境："
  echo ""

  # 詢問是否安裝基本環境
  read -p "是否要安裝基本開發環境 (包含 git, neovim, tmux 等)? (y/n): " install_base

  # 詢問是否安裝 Ruby on Rails 開發環境
  read -p "是否要安裝 Ruby on Rails 開發環境 (包含 rbenv, imagemagick)? (y/n): " install_ror

  echo ""

  # 安裝基本環境
  if [[ "$install_base" =~ ^[Yy]$ ]]; then
    echo "正在安裝基本開發環境..."
    chmod +x $TOOL_APP_DIR/base.sh
    $TOOL_APP_DIR/base.sh
    echo "基本開發環境安裝完成！"
    echo ""
  fi

  # 安裝 RoR 環境
  if [[ "$install_ror" =~ ^[Yy]$ ]]; then
    echo "正在安裝 Ruby on Rails 開發環境..."
    chmod +x $TOOL_APP_DIR/ror.sh
    $TOOL_APP_DIR/ror.sh
    echo "Ruby on Rails 開發環境安裝完成！"
    echo ""
  fi

  if [[ "$install_base" =~ ^[Nn]$ ]] && [[ "$install_ror" =~ ^[Nn]$ ]]; then
    echo "未選擇任何安裝選項，程式結束。"
  else
    echo "安裝完成！享受您的開發環境 🎉"
  fi
fi
