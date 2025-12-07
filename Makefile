.PHONY: setup setup-gpu clean run

# Default setup: CPU or Apple Silicon (Mac)
# Installs standard dependencies from standard PyPI
setup:
	@echo "Installing for Standard/CPU/Mac..."
	uv sync

# GPU setup: NVIDIA
# 1. Installs the 'gpu' group (flash-attn, etc.)
# 2. Points torch to the CUDA 12.1 index defined in pyproject.toml
setup-gpu:
	@echo "Installing for NVIDIA GPU (CUDA 13.0)..."
	uv sync --group gpu --index-strategy unsafe-best-match --extra-index-url https://download.pytorch.org/whl/cu130

# Utility to update the lockfile specifically for a platform if needed
lock:
	uv lock

# Clean up the environment
clean:
	@echo "Removing virtual environment..."
	rm -rf .venv