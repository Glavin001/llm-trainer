#!/usr/bin/env bash
sudo docker compose exec llm-trainer bash -c "$(python -m site --user-base)/bin/jupyter-lab --ip=0.0.0.0"
