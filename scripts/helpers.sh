# bash function
function llm-trainer() {
    sudo docker run \
        --user ubuntu \
        --gpus 1 \
        -v $(pwd):/workspace \
        -v $(pwd)/home/.cache:/root/.cache \
        -v $(pwd)/home/:/home/ubuntu/ \
        -w /workspace lambda-stack:22.04 \
        # first argument of this function
        $
}