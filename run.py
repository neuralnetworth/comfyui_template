#!/usr/bin/env python
"""Launch ComfyUI with UV environment."""

import os
import sys
import subprocess

def main():
    # Ensure we're using the UV virtual environment
    venv_python = os.path.join('.venv', 'bin', 'python')
    if sys.platform == 'win32':
        venv_python = os.path.join('.venv', 'Scripts', 'python.exe')
    
    if os.path.exists(venv_python):
        # Run ComfyUI with the virtual environment Python
        subprocess.run([venv_python, 'main.py'] + sys.argv[1:])
    else:
        print("Error: Virtual environment not found. Please run 'uv venv' first.")
        sys.exit(1)

if __name__ == "__main__":
    main()