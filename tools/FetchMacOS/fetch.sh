#!/bin/bash

# fetch.sh: Run fetch-macos.py with safety checks
# by Foxlet <foxlet@furcode.co>

set +x;
SCRIPTDIR="$(dirname "$0")";
cd "$SCRIPTDIR"

# 1. 检查 uv
if ! command -v uv >/dev/null 2>&1; then
    echo "uv is required. Install: https://docs.astral.sh/uv/getting-started/installation/" >&2
    exit 1
fi

# 2. 用 uv 装依赖到 .venv（不碰系统 Python，不用 --user）
uv pip install -r requirements.txt

uv run --no-project fetch-macos.py "$@"

exit;
