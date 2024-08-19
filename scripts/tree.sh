# ディレクトリ構造を出力するためのスクリプト
function display_structure {
    local dir_path="$1"
    local indent="$2"

    for item in "$dir_path"/*; do
        # 特定のディレクトリを無視する
        if [ -d "$item" ]; then
            local base_name=$(basename "$item")
            if [[ "$base_name" == "node_modules" || "$base_name" == "dist" ]]; then
                continue
            fi
            echo "${indent}├── $base_name"
            display_structure "$item" "$indent    "
        else
            echo "${indent}├── $(basename "$item")"
        fi
    done

    # 隠しファイルも含めて出力する
    for item in "$dir_path"/.*; do
        # "." と ".." ディレクトリを無視する
        local base_name=$(basename "$item")
        if [[ "$base_name" != "." && "$base_name" != ".." ]]; then
            if [ -d "$item" ]; then
                echo "${indent}├── $base_name"
                display_structure "$item" "$indent    "
            else
                echo "${indent}├── $(basename "$item")"
            fi
        fi
    done
}

echo "."
display_structure "." ""
