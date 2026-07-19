#!/bin/bash
# Clone OS installer — curl経由なのでGatekeeperの隔離が付かず、警告なしで起動できる
set -e
echo "⏬ Clone OS をダウンロードしています…"
TMP=$(mktemp -d)
curl -fsSL -o "$TMP/CloneOS.zip" "https://github.com/zerogridcompany-cell/clone-os-releases/releases/latest/download/CloneAIOS-mac-arm64.zip"
echo "📦 インストールしています…"
ditto -x -k "$TMP/CloneOS.zip" "$TMP"
osascript -e 'tell application "Clone AI OS" to quit' 2>/dev/null || true
sleep 1
rm -rf "/Applications/Clone AI OS.app"
mv "$TMP/Clone AI OS.app" "/Applications/"
xattr -cr "/Applications/Clone AI OS.app" 2>/dev/null || true
rm -rf "$TMP"
open "/Applications/Clone AI OS.app"
echo "✅ 完了 — Clone OS が起動しました"
