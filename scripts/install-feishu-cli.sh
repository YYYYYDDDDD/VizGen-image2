#!/usr/bin/env bash
# 安装飞书 (Lark) 官方 CLI
#
# 安装的是 larksuite 官方维护的 Feishu/Lark OpenAPI 命令行工具：
#   npm 包: @larksuiteoapi/lark-mcp
#   命令名: lark-mcp
#   仓库:   https://github.com/larksuite/lark-openapi-mcp
#
# 用法:
#   bash scripts/install-feishu-cli.sh          # 全局安装最新版
#   FEISHU_CLI_VERSION=0.5.1 bash scripts/install-feishu-cli.sh   # 指定版本
set -euo pipefail

PKG="@larksuiteoapi/lark-mcp"
VERSION="${FEISHU_CLI_VERSION:-latest}"

if ! command -v npm >/dev/null 2>&1; then
  echo "错误: 未找到 npm，请先安装 Node.js (>=18) 与 npm。" >&2
  exit 1
fi

echo "正在全局安装 ${PKG}@${VERSION} ..."
npm install -g "${PKG}@${VERSION}"

echo
echo "安装完成。版本信息:"
lark-mcp --version || true

echo
echo "验证命令是否可用:"
command -v lark-mcp && echo "OK: 已可通过 'lark-mcp' 调用飞书 CLI。"
