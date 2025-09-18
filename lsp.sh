#!/bin/bash

# 檢查所需的套件管理器是否安裝
echo "檢查套件管理器..."

# 檢查 npm
if ! [ "$(command -v npm)" ] ; then
  echo "❌ npm 尚未安裝，請先安裝 Node.js 和 npm"
  echo "   可以使用 brew install node 安裝"
  exit 1
else
  echo "✅ npm 已安裝"
fi

# 檢查 pip
if ! [ "$(command -v pip)" ] && ! [ "$(command -v pip3)" ] ; then
  echo "❌ pip 尚未安裝，請先安裝 Python 和 pip"
  echo "   可以使用 brew install python 安裝"
  exit 1
else
  echo "✅ pip 已安裝"
fi

# 檢查 gem
if ! [ "$(command -v gem)" ] ; then
  echo "❌ gem 尚未安裝，請先安裝 Ruby"
  echo "   可以使用 brew install ruby 安裝"
  exit 1
else
  echo "✅ gem 已安裝"
fi

# 檢查 brew
if ! [ "$(command -v brew)" ] ; then
  echo "❌ brew 尚未安裝，請先安裝 Homebrew"
  exit 1
else
  echo "✅ brew 已安裝"
fi

echo ""

# 檢查並安裝 Ruby LSP (Solargraph)
echo "檢查 Solargraph (Ruby LSP) 是否安裝..."
if ! gem list solargraph -i &>/dev/null; then
  echo -e "\033[33m尚未安裝 Solargraph, 準備開始安裝...\033[0m"
  gem install solargraph
else
  echo -e "\033[32m已安裝 Solargraph\033[0m"
fi

# 檢查並安裝 TypeScript Language Server
echo "檢查 TypeScript Language Server 是否安裝..."
if ! npm list -g typescript-language-server &>/dev/null; then
  echo -e "\033[33m尚未安裝 TypeScript Language Server, 準備開始安裝...\033[0m"
  npm install -g typescript-language-server typescript
else
  echo -e "\033[32m已安裝 TypeScript Language Server\033[0m"
fi

# 檢查並安裝 Lua Language Server
echo "檢查 Lua Language Server 是否安裝..."
if ! brew list lua-language-server &>/dev/null; then
  echo -e "\033[33m尚未安裝 Lua Language Server, 準備開始安裝...\033[0m"
  brew install lua-language-server
else
  echo -e "\033[32m已安裝 Lua Language Server\033[0m"
fi

# 檢查並安裝 Python LSP Server
echo "檢查 Python LSP Server 是否安裝..."
# 檢查 pip, pip3, 或 pipx 是否已安裝 python-lsp-server
if ! pip show python-lsp-server &>/dev/null && ! pip3 show python-lsp-server &>/dev/null && ! pipx list | grep -q python-lsp-server &>/dev/null; then
  echo -e "\033[33m尚未安裝 Python LSP Server, 準備開始安裝...\033[0m"

  # 檢查是否有 pipx
  if [ "$(command -v pipx)" ] ; then
    echo "使用 pipx 安裝 Python LSP Server..."
    pipx install python-lsp-server
  else
    echo "pipx 尚未安裝，正在安裝 pipx..."
    brew install pipx
    echo "使用 pipx 安裝 Python LSP Server..."
    pipx install python-lsp-server
  fi
else
  echo -e "\033[32m已安裝 Python LSP Server\033[0m"
fi

echo ""
echo "LSP 伺服器檢查完成！"
echo "您現在可以在 Neovim 中配置這些 LSP 伺服器："
echo "  - Solargraph (Ruby)"
echo "  - TypeScript Language Server (JS/TS)"
echo "  - Lua Language Server (Lua)"
echo "  - Python LSP Server (Python)"

exit 0
