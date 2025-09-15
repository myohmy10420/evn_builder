#!/bin/bash

echo "安裝 Python 開發環境 (FastAPI + LlamaIndex + Qdrant)..."

# 安裝 Python 相關工具
list=("python@3.11" "pipenv" "poetry" "pyenv")
apps=""

for app in "${list[@]}"; do
  echo "檢查 $app 是否安裝..."
  if ! brew list "$app" &>/dev/null; then
    echo "尚未安裝 $app, 等候安裝..."
    apps="$apps $app"
  else
    echo "已安裝 $app"
  fi
done

if [ -z "$apps" ] ; then
  echo -e "沒有東西需要 Homebrew 安裝了"
else
  echo -e "Homebrew 準備開始安裝$apps ..."
  brew install $apps
fi

# 設定 pyenv
if [ "$(command -v pyenv)" ] ; then
  echo "設定 pyenv..."
  if ! grep -q 'pyenv init' ~/.zshrc; then
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
    echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
    echo 'eval "$(pyenv init -)"' >> ~/.zshrc
    echo "已將 pyenv init 加入 ~/.zshrc"
  fi
fi

# 檢查 Python 版本
echo "檢查 Python 版本..."
python_version=$(python3 --version 2>&1 | cut -d' ' -f2)
required_version="3.10"

if [ "$(printf '%s\n' "$required_version" "$python_version" | sort -V | head -n1)" = "$required_version" ]; then
  echo "✅ Python 版本 $python_version 符合需求 (>= $required_version)"
else
  echo "⚠️  Python 版本 $python_version 可能需要升級 (建議 >= $required_version)"
  if [ "$(command -v pyenv)" ] ; then
    echo "可以使用 'pyenv install 3.11.0' 安裝新版本"
    echo "然後使用 'pyenv global 3.11.0' 設定全域版本"
  fi
fi

# 安裝常用 Python 開發工具
echo "安裝常用 Python 開發工具..."
dev_tools=("black" "flake8" "pytest" "ipython")
tools_apps=""

for tool in "${dev_tools[@]}"; do
  echo "檢查 $tool 是否安裝..."
  if ! brew list "$tool" &>/dev/null; then
    echo "尚未安裝 $tool, 等候安裝..."
    tools_apps="$tools_apps $tool"
  else
    echo "已安裝 $tool"
  fi
done

if [ ! -z "$tools_apps" ] ; then
  echo -e "Homebrew 準備開始安裝開發工具$tools_apps ..."
  brew install $tools_apps
fi

echo ""
echo "🐍 Python 開發環境設定完成！"
echo ""
echo "建議的 FastAPI + LlamaIndex + Qdrant 專案設定："
echo "1. 建立專案目錄: mkdir my-qa-project && cd my-qa-project"
echo "2. 初始化虛擬環境: python3 -m venv venv"
echo "3. 啟用虛擬環境: source venv/bin/activate"
echo "4. 安裝依賴套件:"
echo "   pip install fastapi uvicorn llama-index qdrant-client python-multipart"
echo "   pip install python-dotenv pydantic-settings"
echo "5. 建立 requirements.txt: pip freeze > requirements.txt"
echo ""
echo "請執行 'source ~/.zshrc' 或重新啟動終端機以使設定生效"

exit 0