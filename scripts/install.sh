#!/usr/bin/env bash

echo "Installing dependencies..."
# sudo apt-get update
# sudo apt-get dist-upgrade
# sudo apt-get install -y docker.io nvidia-container-toolkit

# ssh -T git@github.com

# TODO: First check if docker is installed
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo docker run hello-world

sudo docker build -t lambda-stack:22.04 -f Dockerfile .

sudo docker run --gpus 1 lambda-stack:22.04 python3 -c "import torch; print(torch.cuda.device_count())"
