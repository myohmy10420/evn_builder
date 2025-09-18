#!/bin/bash

TOOL_APP_DIR=$(dirname "$0")

# 檢查網路連線
echo "檢查網路連線..."
if ! ping -c 1 google.com &>/dev/null && ! ping -c 1 8.8.8.8 &>/dev/null; then
  echo "❌ 網路連線失敗！請檢查您的網路連線後再執行此腳本。"
  echo "   安裝過程需要從網路下載 Homebrew 和其他工具。"
  exit 1
fi
echo "✅ 網路連線正常"
echo ""

if [[ "`uname -s`" == "Darwin" ]]; then
  echo "歡迎使用 macOS 開發環境安裝工具"
  echo "您可以選擇要安裝的環境："
  echo ""

  # 詢問是否安裝基本環境
  read -p "是否要安裝基本開發環境 (包含 git, neovim, tmux 等)? (y/n): " install_base

  # 詢問是否安裝 Ruby on Rails 開發環境
  read -p "是否要安裝 Ruby on Rails 開發環境 (包含 rbenv, imagemagick)? (y/n): " install_ror

  # 詢問是否安裝 Python 開發環境
  read -p "是否要安裝 Python 開發環境 (包含 Python 3.11, poetry, FastAPI 相關)? (y/n): " install_python

  # 詢問是否安裝 Docker 開發環境
  read -p "是否要安裝 Docker 開發環境 (包含 Docker Desktop, docker-compose)? (y/n): " install_docker

  # 詢問是否安裝 Neovim LSP 伺服器
  read -p "是否要安裝 Neovim LSP 伺服器 (包含 Ruby, JS/TS, Lua, Python LSP)? (y/n): " install_lsp

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

  # 安裝 Python 環境
  if [[ "$install_python" =~ ^[Yy]$ ]]; then
    echo "正在安裝 Python 開發環境..."
    chmod +x $TOOL_APP_DIR/python.sh
    $TOOL_APP_DIR/python.sh
    echo "Python 開發環境安裝完成！"
    echo ""
  fi

  # 安裝 Docker 環境
  if [[ "$install_docker" =~ ^[Yy]$ ]]; then
    echo "正在安裝 Docker 開發環境..."
    chmod +x $TOOL_APP_DIR/docker.sh
    $TOOL_APP_DIR/docker.sh
    echo "Docker 開發環境安裝完成！"
    echo ""
  fi

  # 安裝 LSP 環境
  if [[ "$install_lsp" =~ ^[Yy]$ ]]; then
    echo "正在安裝 Neovim LSP 伺服器..."
    chmod +x $TOOL_APP_DIR/lsp.sh
    $TOOL_APP_DIR/lsp.sh
    echo "Neovim LSP 伺服器安裝完成！"
    echo ""
  fi

  if [[ "$install_base" =~ ^[Nn]$ ]] && [[ "$install_ror" =~ ^[Nn]$ ]] && [[ "$install_python" =~ ^[Nn]$ ]] && [[ "$install_docker" =~ ^[Nn]$ ]] && [[ "$install_lsp" =~ ^[Nn]$ ]]; then
    echo "未選擇任何安裝選項，程式結束。"
  else
    echo "安裝完成！享受您的開發環境 🎉"
  fi
fi
