@echo off
REM Launch ComfyUI with UV environment

cd /d "%~dp0"

REM Check if virtual environment exists
if not exist ".venv" (
    echo Virtual environment not found. Creating one with UV...
    uv venv
)

REM Activate virtual environment and run ComfyUI
call .venv\Scripts\activate.bat
python main.py %*