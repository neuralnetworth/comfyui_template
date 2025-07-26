#!/bin/bash
# Launch ComfyUI with UV environment

# Get the directory of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "$SCRIPT_DIR"

# Check if virtual environment exists
if [ ! -d ".venv" ]; then
    echo "Virtual environment not found. Creating one with UV..."
    uv venv
fi

# Activate virtual environment
source .venv/bin/activate

# Launch ComfyUI
python main.py "$@"