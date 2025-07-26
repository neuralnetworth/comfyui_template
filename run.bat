@echo off
REM Launch ComfyUI with UV environment

cd /d "%~dp0"

REM Check if virtual environment exists
if not exist ".venv" (
    echo Virtual environment not found. Running 'uv sync' to set up...
    uv sync
)

REM Check if this is first run
if not exist "user\.first_run_complete" (
    echo ============================================================
    echo 🚀 FIRST TIME COMFYUI STARTUP
    echo ============================================================
    echo This may take 30-60 seconds as ComfyUI-Manager initializes.
    echo Subsequent startups will be much faster.
    echo.
    echo Please wait while:
    echo   - ComfyUI-Manager performs security checks
    echo   - Dependencies are installed
    echo   - Custom nodes are scanned
    echo ============================================================
    echo.
)

REM Launch ComfyUI using UV
echo Starting ComfyUI server...
uv run python main.py %*