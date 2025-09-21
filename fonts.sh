#!/bin/bash

echo "檢查字型和圖標相關工具是否安裝..."

# 檢查 Homebrew 是否安裝
if ! [ "$(command -v brew)" ] ; then
  echo "❌ Homebrew 尚未安裝，請先安裝 Homebrew"
  echo "   可以使用以下命令安裝: /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
  exit 1
else
  echo "✅ Homebrew 已安裝"
fi

echo ""

# 字型相關工具列表 (現在字型已整合到 homebrew/cask)
font_tools=("font-hack-nerd-font" "font-meslo-lg-nerd-font" "font-fira-code-nerd-font" "font-jetbrains-mono-nerd-font")
system_tools=("sf-symbols" "fontforge")

apps=""

echo ""

# 檢查字型是否安裝
for font in "${font_tools[@]}"; do
  echo "檢查 $font 是否安裝..."
  if ! brew list --cask "$font" &>/dev/null; then
    echo -e "\033[33m尚未安裝 $font, 等候安裝...\033[0m"
    apps="$apps $font"
  else
    echo -e "\033[32m已安裝 $font\033[0m"
  fi
done

# 檢查系統工具
for tool in "${system_tools[@]}"; do
  echo "檢查 $tool 是否安裝..."
  if ! brew list --cask "$tool" &>/dev/null; then
    echo -e "\033[33m尚未安裝 $tool, 等候安裝...\033[0m"
    apps="$apps $tool"
  else
    echo -e "\033[32m已安裝 $tool\033[0m"
  fi
done

echo ""

# 安裝所需的字型和工具
if [ -z "$apps" ] ; then
  echo -e "所有字型和工具都已安裝"
else
  echo -e "準備安裝字型和工具:$apps ..."
  brew install --cask $apps
fi

echo ""

# 檢查 PowerLevel10k 字型建議
echo "檢查 PowerLevel10k 建議的 Meslo Nerd Font..."
meslo_fonts_path="$HOME/Library/Fonts"

# 檢查是否存在 MesloLGS NF 字型檔案
if ls "$meslo_fonts_path"/MesloLGS* &>/dev/null; then
  echo -e "\033[32m已安裝 MesloLGS NF 字型\033[0m"
else
  echo -e "\033[33m下載 PowerLevel10k 建議的 MesloLGS NF 字型...\033[0m"

  # 創建字型目錄
  mkdir -p "$meslo_fonts_path"

  # 下載 MesloLGS NF 字型
  meslo_urls=(
    "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
    "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
    "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
    "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"
  )

  for url in "${meslo_urls[@]}"; do
    filename=$(basename "$url" | sed 's/%20/ /g')
    echo "下載 $filename..."
    curl -L -o "$meslo_fonts_path/$filename" "$url"
  done

  echo "重新載入字型快取..."
  sudo atsutil databases -remove
  atsutil server -shutdown
  atsutil server -ping
fi

echo ""

# 顯示安裝完成訊息和建議
echo "🎉 字型和圖標工具安裝完成！"
echo ""
echo "📋 已安裝的字型："
echo "  • Hack Nerd Font (您的 Alacritty 設定使用)"
echo "  • Meslo LG Nerd Font"
echo "  • Fira Code Nerd Font"
echo "  • JetBrains Mono Nerd Font"
echo "  • MesloLGS NF (PowerLevel10k 專用)"
echo ""
echo "🔧 已安裝的工具："
echo "  • SF Symbols (Apple 圖標字型)"
echo "  • FontForge (字型編輯器)"
echo ""
echo "⚙️  設定建議："
echo "  • 您的 Alacritty 已設定使用 'Hack Nerd Font'"
echo "  • 您的 PowerLevel10k 使用 'nerdfont-complete' 模式"
echo "  • 如果圖標顯示異常，可以嘗試："
echo "    - 重新啟動 Terminal"
echo "    - 執行 'p10k configure' 重新設定 PowerLevel10k"
echo "    - 在 Alacritty 中嘗試其他 Nerd Font 字型"
echo ""
echo "🔗 相關連結："
echo "  • Nerd Fonts: https://www.nerdfonts.com/"
echo "  • PowerLevel10k 字型指南: https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k"

exit 0