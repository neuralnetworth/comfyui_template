#!/usr/bin/env python
"""Launch ComfyUI with UV environment."""

import os
import sys
import subprocess
import time

def main():
    # Check if this is first run
    first_run_marker = os.path.join('user', '.first_run_complete')
    is_first_run = not os.path.exists(first_run_marker)
    
    if is_first_run:
        print("=" * 60)
        print("🚀 FIRST TIME COMFYUI STARTUP")
        print("=" * 60)
        print("This may take 30-60 seconds as ComfyUI-Manager initializes.")
        print("Subsequent startups will be much faster.\n")
        print("Please wait while:")
        print("  • ComfyUI-Manager performs security checks")
        print("  • Dependencies are installed")
        print("  • Custom nodes are scanned")
        print("=" * 60)
        print()
    
    # Ensure we're using the UV virtual environment
    venv_python = os.path.join('.venv', 'bin', 'python')
    if sys.platform == 'win32':
        venv_python = os.path.join('.venv', 'Scripts', 'python.exe')
    
    if os.path.exists(venv_python):
        # Run ComfyUI with the virtual environment Python
        try:
            process = subprocess.Popen([venv_python, 'main.py'] + sys.argv[1:])
            
            # If first run, wait a bit and show progress
            if is_first_run:
                print("\nStarting ComfyUI server...")
                for i in range(30):
                    time.sleep(1)
                    print(".", end="", flush=True)
                    # Check if process is still running
                    if process.poll() is not None:
                        break
                print("\n")
                
                # Create marker file for next time
                os.makedirs('user', exist_ok=True)
                with open(first_run_marker, 'w') as f:
                    f.write("First run completed")
            
            # Wait for the process to complete
            process.wait()
            
        except KeyboardInterrupt:
            print("\n\nShutting down ComfyUI...")
            process.terminate()
            sys.exit(0)
    else:
        print("Error: Virtual environment not found. Please run 'uv sync' first.")
        sys.exit(1)

if __name__ == "__main__":
    main()