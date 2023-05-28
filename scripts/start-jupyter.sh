#!/usr/bin/env bash
set -e

echo "Installing dependencies..."
pip3 install -r requirements.txt

echo "Starting Jupyter Lab..."
$(python3 -m site --user-base)/bin/jupyter-lab --ip=0.0.0.0
