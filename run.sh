#!/bin/bash
# Launch ComfyUI with UV environment

# Get the directory of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "$SCRIPT_DIR"

# Check if virtual environment exists
if [ ! -d ".venv" ]; then
    echo "Virtual environment not found. Running 'uv sync' to set up..."
    uv sync
fi

# Check if this is first run
FIRST_RUN_MARKER="user/.first_run_complete"
if [ ! -f "$FIRST_RUN_MARKER" ]; then
    echo "============================================================"
    echo "🚀 FIRST TIME COMFYUI STARTUP"
    echo "============================================================"
    echo "This may take 30-60 seconds as ComfyUI-Manager initializes."
    echo "Subsequent startups will be much faster."
    echo ""
    echo "Please wait while:"
    echo "  • ComfyUI-Manager performs security checks"
    echo "  • Dependencies are installed"
    echo "  • Custom nodes are scanned"
    echo "============================================================"
    echo ""
fi

# Launch ComfyUI using UV
echo "Starting ComfyUI server..."
uv run python main.py "$@"