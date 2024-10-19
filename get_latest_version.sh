#!/bin/bash

REPO="maifu/sillytavern"

# 获取 Docker Hub 上指定仓库的标签数据
json_data=$(curl -s "https://registry.hub.docker.com/v2/repositories/${REPO}/tags/")

# 提取最新版本的标签名，排除 latest 标签
latest_version_docker=$(echo "$json_data" | jq -r '.results | map(select(.name != "latest")) | max_by(.last_updated) | .name')

# 检查是否成功获取最新版本
if [ -z "$latest_version_docker" ]; then
    echo "Failed to fetch the latest tag or the repository/tag does not exist."
else
    echo "The latest tag version is: $latest_version_docker"

    # Export the latest version
    echo "Setting environment variable latest_version_docker to $latest_version_docker"
    echo "latest_version_docker=$latest_version_docker" >> $GITHUB_ENV
fi