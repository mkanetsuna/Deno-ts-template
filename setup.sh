#!/bin/bash
set -e

# プロジェクトディレクトリに移動
cd /workspaces/Deno-ts-template

# Denoのキャッシュディレクトリを作成
mkdir -p .deno_dir
chmod 755 .deno_dir

# 環境変数を設定
echo 'export DENO_DIR="/home/vscode/.cache/deno"' >> ~/.bashrc
source ~/.bashrc

# 権限を設定
sudo chown -R vscode:vscode .
chmod -R 755 .

# 依存関係をキャッシュ
deno cache --reload src/main.ts

echo "Setup completed successfully!"