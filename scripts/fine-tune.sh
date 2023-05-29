#!/usr/bin/env bash

# python qlora.py \
#     --model_name_or_path EleutherAI/pythia-12b \
#     --output_dir ./output \
#     --dataset alpaca \
#     --do_train True \
#     --do_eval True \
#     --do_mmlu_eval True \
#     --source_max_len 384 \
#     --target_max_len 128 \
#     --per_device_train_batch_size 4 \
#     --per_device_eval_batch_size 4 \
#     --gradient_accumulation_steps 4 \
#     --logging_steps 10 \
#     --max_steps 10000 \
#     --save_strategy steps \
#     --data_seed 42 \
#     --save_steps 1000 \
#     --save_total_limit 40 \
#     --evaluation_strategy steps \
#     --eval_dataset_size 1024 \
#     --max_eval_samples 1000 \
#     --eval_steps 1000 \
#     --optim paged_adamw_32bit \

# python3 ./scripts/qlora.py \
#     --model_name_or_path huggyllama/llama-7b \
#     --output_dir ./output-edie-v1.0.3 \
#     --dataset edie-v1 \
#     --do_train True \
#     --do_eval True \
#     --report_to wandb \
#     --logging_steps 1 \
#     --max_steps 10 \
#     --learning_rate 0.0001 \
#     --per_device_train_batch_size 4 \
#     --per_device_eval_batch_size 4 \
#     --gradient_accumulation_steps 4 \
#     --save_strategy steps \
#     --save_steps 5 \
#     --data_seed 42 \
#     --optim paged_adamw_32bit \
#     --source_max_len 1536 \
#     --target_max_len 512 \
#     --evaluation_strategy steps \
#     # --max_steps 30 \
#     # --save_total_limit 40 \
#     # --eval_dataset_size 1024 \
#     # --max_eval_samples 100 \
#     # --eval_steps 1000 \
#     # --max_train_samples 100 \
#     # --output_dir ./output-qlora \
#     # --dataset self-instruct \
#     # --do_mmlu_eval True \


python3 ./scripts/qlora.py \
    --model_name_or_path EleutherAI/pythia-12b \
    --output_dir ./output-edie-pythia-v1.0.1 \
    --dataset edie-v1 \
    --do_train True \
    --do_eval True \
    --report_to wandb \
    --logging_steps 1 \
    --max_steps 20 \
    --learning_rate 0.0002 \
    --per_device_train_batch_size 4 \
    --per_device_eval_batch_size 4 \
    --gradient_accumulation_steps 4 \
    --save_strategy steps \
    --save_steps 5 \
    --data_seed 42 \
    --optim paged_adamw_32bit \
    --source_max_len 1536 \
    --target_max_len 512 \
    --evaluation_strategy steps \
    --eval_dataset_size 4 \
    # --source_max_len 1536 \
    # --target_max_len 512 \
    # --max_steps 30 \
    # --save_total_limit 40 \
    # --max_eval_samples 100 \
    # --eval_steps 1000 \
    # --max_train_samples 100 \
    # --output_dir ./output-qlora \
    # --dataset self-instruct \
    # --do_mmlu_eval True \
