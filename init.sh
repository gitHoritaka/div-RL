#!/bin/bash
set -eux

mkdir -p jobs

PYTHON_BIN=python3.10

rm -rf dist-RL-env 

uv venv --python "$PYTHON_BIN" dist-RL-env 

source dist-RL-env/bin/activate

uv pip install -U pip setuptools wheel
uv pip install -U pytorch

uv run python -c "import sys, ray; print(sys.version); print(ray.__version__)"

deactivate
~             
