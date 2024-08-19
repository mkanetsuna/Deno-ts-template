#!/bin/bash

# Deno project setup script

# Exit immediately if a command exits with a non-zero status
set -e

# Print commands and their arguments as they are executed
set -x

# 1. Ensure we're in the project directory
cd /workspaces/Deno-ts-template

# 2. Create custom DENO_DIR
mkdir -p .deno_dir
chmod 755 .deno_dir

# 3. Set DENO_DIR environment variable
echo 'export DENO_DIR="/workspaces/Deno-ts-template/.deno_dir"' >> ~/.bashrc
source ~/.bashrc

# 4. Clear Deno cache
rm -rf $DENO_DIR/*

# 5. Set correct permissions for project directory
sudo chown -R vscode:vscode .
chmod -R 755 .

# 6. Ensure deno.json has correct permissions
chmod 644 deno.json

# 7. Cache Deno dependencies
deno cache --reload src/main.ts

# 8. Display current Deno version instead of upgrading
echo "Current Deno version:"
deno --version

# 9. Create/update VSCode Deno extension settings
mkdir -p .vscode
cat << EOF > .vscode/settings.json
{
  "deno.enable": true,
  "deno.lint": true,
  "deno.unstable": false,
  "deno.importMap": "./deno.json"
}
EOF

echo "Setup completed successfully!"