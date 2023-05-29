# LLM Trainer

> Training/Fine-Tuning Large Language Models

<!--
Appears to be already installed
1. Install Lambda Stack: https://lambdalabs.com/lambda-stack-deep-learning-software
Lambda Cloud should already come with `docker` and `docker compose` plugin installed.
-->

Login to Docker:

```bash
sudo docker login
```

Pull existing Docker image to warm build cache:

```bash
sudo docker pull glavin001/llm-trainer:may-28-433
```

Build & start container with Jupyter labs/notebook:

```bash
sudo docker compose up --build
```

If you see error:
> tornado.web.HTTPError: HTTP 403: Forbidden

Then stop the docker container and retry.


Login to Weights and Biases:

```bash
wandb login -u USERNAME
```

```bash
./scripts/train.sh
```
