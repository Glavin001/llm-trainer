#!/usr/bin/env bash
# sudo docker run --gpus 1 lambda-stack:22.04 python3 -c "import torch; print(torch.cuda.device_count())"

# Pass in current directory as volume
# sudo docker run --gpus 1 -v $(pwd):/workspace lambda-stack:22.04
# with CWD set to /workspace
# sudo docker run --gpus 1 -v $(pwd):/workspace -w /workspace lambda-stack:22.04 python3 ./scripts/fine-tune.py
# sudo docker run --gpus 1 -v $(pwd):/workspace -w /workspace lambda-stack:22.04 ls /usr/lib/x86_64-linux-gnu
# sudo docker run --gpus 1 -v $(pwd):/workspace -w /workspace lambda-stack:22.04 nvcc --version
# sudo docker run --gpus 1 -v $(pwd):/workspace -w /workspace lambda-stack:22.04 ls -la ~/
# sudo docker run --gpus 1 -v $(pwd):/workspace -w /workspace lambda-stack:22.04 ls -la /root/.cache
# sudo docker run --gpus 1 -v $(pwd):/workspace -w /workspace lambda-stack:22.04 ls -la /workspace
sudo docker run \
    --user ubuntu \
    --gpus 1 \
    -v $(pwd):/workspace \
    -v $(pwd)/home/.cache:/root/.cache \
    -v $(pwd)/home/:/home/ubuntu/ \
    -w /workspace lambda-stack:22.04 \
    env
    # jupyter-lab
    # pip install -r requirements.txt
    # pip install jupyterlab
    # jupyter notebook
    # python3 ./scripts/fine-tune.py
    # ls -la ~/.cache/huggingface
    # wandb login <wandb-api-key>
    # -v $(pwd)/.cache:/root/.cache \
    # -v $(pwd)/.cache:/home/ubuntu/.cache \
    # -v $(pwd)/.config:/home/ubuntu/.config \
    # ls -la /home/ubuntu/
    # pwd