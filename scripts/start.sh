#!/bin/bash

# 環境変数の設定
export DENO_DIR=".deno"
export PATH="$PATH:$PWD/.deno/bin"

# アプリケーションの起動
deno task dev