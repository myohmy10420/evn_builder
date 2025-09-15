#!/bin/bash

echo "安裝 Docker 開發環境..."

# 檢查是否已安裝 Docker Desktop
if [ -d "/Applications/Docker.app" ]; then
  echo "✅ 已安裝 Docker Desktop"
else
  echo "安裝 Docker Desktop..."
  if ! brew list --cask docker &>/dev/null; then
    echo "透過 Homebrew 安裝 Docker Desktop..."
    brew install --cask docker
  else
    echo "已透過 Homebrew 安裝 Docker Desktop"
  fi
fi

# 安裝 Docker 相關工具
list=("docker-compose" "lazydocker")
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

# 檢查 Docker 是否運行
echo "檢查 Docker 服務狀態..."
if ! docker info &>/dev/null; then
  echo "⚠️  Docker 服務未運行，請啟動 Docker Desktop"
  echo "   可以從 Applications 資料夾打開 Docker.app"
  echo "   或使用: open -a Docker"
else
  echo "✅ Docker 服務運行正常"
  docker_version=$(docker --version)
  echo "   $docker_version"
fi

echo ""
echo "🐳 Docker 開發環境設定完成！"
echo ""
echo "建議的 Qdrant + 專案 Docker 設定："
echo "1. 建立 docker-compose.yml:"
echo "   services:"
echo "     qdrant:"
echo "       image: qdrant/qdrant:latest"
echo "       ports:"
echo "         - 6333:6333"
echo "         - 6334:6334"
echo "       volumes:"
echo "         - ./qdrant_storage:/qdrant/storage"
echo ""
echo "2. 啟動 Qdrant: docker-compose up -d qdrant"
echo "3. 查看容器狀態: docker-compose ps"
echo "4. 查看日誌: docker-compose logs qdrant"
echo "5. 停止服務: docker-compose down"
echo ""
echo "Qdrant Web UI: http://localhost:6333/dashboard"
echo "Qdrant API: http://localhost:6333"
echo ""
echo "懶人工具："
echo "- lazydocker: 終端機 Docker 管理介面"
echo "- 使用 'lazydocker' 指令啟動"

exit 0