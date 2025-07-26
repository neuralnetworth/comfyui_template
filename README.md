# ComfyUI Local Development Setup

A complete ComfyUI template repository with UV package manager for fast dependency management and NVIDIA GPU support. This repository includes all ComfyUI source files for easy deployment on multiple machines.

## Prerequisites

- Python 3.12 (recommended)
- UV package manager (`pip install uv`)
- Git
- NVIDIA GPU with CUDA support (tested with RTX 4080 Super)
- CUDA toolkit installed on your system

## Quick Start

1. Clone this repository:
   ```bash
   git clone https://github.com/neuralnetworth/comfyui.git
   cd comfyui
   ```

2. Install UV if not already installed:
   ```bash
   pip install uv
   ```

3. Install dependencies with UV:
   ```bash
   uv sync
   ```

4. Configure ComfyUI Manager for UV support:
   ```bash
   cp comfyui_manager_config.ini custom_nodes/ComfyUI-Manager/config.ini
   ```

5. Run ComfyUI:
   ```bash
   # On Unix-like systems
   ./run.sh
   
   # On Windows
   run.bat
   
   # Or directly with Python
   python run.py
   ```

## Project Structure

```
comfyui/
├── .venv/               # UV virtual environment
├── models/              # Model checkpoints
├── input/               # Input images
├── output/              # Generated images
├── custom_nodes/        # Custom ComfyUI nodes
├── .claude/             # Claude AI configuration
├── pyproject.toml       # UV/Python dependencies
├── uv.lock             # Locked dependencies
├── run.py              # Python launch script
├── run.sh              # Unix launch script
└── run.bat             # Windows launch script
```

## GPU Configuration

This setup is configured for NVIDIA GPUs with CUDA 12.8 support. The configuration automatically:
- Detects and uses CUDA on Linux/Windows
- Falls back to CPU on macOS
- Optimizes for NVIDIA RTX 4080 Super

## Model Management

Place your Stable Diffusion models in the `models/` directory, organized by type:
- `models/checkpoints/` - Main model files (.safetensors, .ckpt)
- `models/vae/` - VAE models
- `models/loras/` - LoRA models
- `models/controlnet/` - ControlNet models

You can also configure external model paths in `extra_model_paths.yaml`.

## Development with Claude

This project includes Claude AI integration. Use `claude` commands for AI-assisted development:
```bash
claude --help
```

## Updating ComfyUI

To update ComfyUI to the latest version:
```bash
git pull origin main
uv sync
```

## Troubleshooting

### CUDA Not Found
Ensure CUDA toolkit is installed and available in your PATH. Verify with:
```bash
nvidia-smi
nvcc --version
```

### Module Import Errors
Re-sync dependencies:
```bash
uv sync --reinstall
```

### Out of Memory Errors
ComfyUI automatically manages VRAM. For RTX 4080 Super (16GB VRAM), most models should work without issues.

## License

This project setup is open source. ComfyUI itself is licensed under GPL-3.0.