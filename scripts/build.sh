#!/usr/bin/env bash
# sudo docker build -t lambda-stack:22.04 -f Dockerfile .
sudo docker build -t glavin001/llm-trainer:latest -f Dockerfile .

# docker push glavin001/llm-trainer:latest
