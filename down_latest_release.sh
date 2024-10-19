#!/bin/bash

# 设置仓库的所有者和仓库名称
OWNER="SillyTavern"
REPO="SillyTavern"

# 使用 GitHub API 获取最新 release 的下载链接
API_URL="https://api.github.com/repos/$OWNER/$REPO/releases/latest"

# 获取最新 release 的 tar.gz 下载链接
DOWNLOAD_URL=$(curl -s $API_URL | jq -r '.tarball_url')

# 获取最新版本号
LATEST_VERSION=$(curl -s $API_URL | jq -r '.tag_name')

# 检查是否获取到了下载链接
if [ "$DOWNLOAD_URL" != "null" ] && [ "$LATEST_VERSION" != "null" ]; then
    # 下载 tar.gz 文件
    echo "Downloading the latest release from: $DOWNLOAD_URL"
    curl -L -o "latest.tar.gz" "$DOWNLOAD_URL"  
    echo "Downloaded as latest.tar.gz"

    # Export the latest version
    echo "Setting environment variable LATEST_VERSION to $LATEST_VERSION"
    echo "LATEST_VERSION=$LATEST_VERSION" >> $GITHUB_ENV
else
    echo "No release found or failed to fetch release info."
    exit 1  # Exit with error code
fi