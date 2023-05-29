# python qlora.py \
#     --model_name_or_path EleutherAI/pythia-12b \
#     --output_dir ./output \
#     --do_train False \
#     --do_eval False \
#     --do_predict True \
#     --predict_with_generate \
#     --per_device_eval_batch_size 4 \
#     --dataset alpaca \
#     --source_max_len 512 \
#     --target_max_len 128 \
#     --max_new_tokens 64 \
#     --do_sample \
#     --top_p 0.9 \
#     --num_beams 1 \

# python ./scripts/qlora.py \
#     --model_name_or_path huggyllama/llama-7b \
#     --output_dir ./output-edie-v1.0.3 \
#     --dataset edie-v1 \
#     --report_to wandb \
#     --logging_steps 1 \
#     --do_train False \
#     --do_eval False \
#     --do_predict True \
#     --max_eval_samples 4 \
#     --predict_with_generate \
#     --per_device_eval_batch_size 4 \
#     --source_max_len 1536 \
#     --target_max_len 512 \
#     --max_new_tokens 512 \
#     --do_sample \
#     --top_p 0.9 \
#     --num_beams 1


python ./scripts/qlora.py \
    --model_name_or_path EleutherAI/pythia-12b \
    --output_dir ./output-edie-pythia-v1.0.1 \
    --dataset edie-v1 \
    --report_to wandb \
    --logging_steps 1 \
    --do_train False \
    --do_eval False \
    --do_predict True \
    --max_eval_samples 4 \
    --predict_with_generate \
    --per_device_eval_batch_size 4 \
    --source_max_len 1536 \
    --target_max_len 512 \
    --max_new_tokens 100 \
    --do_sample \
    --top_p 0.9 \
    --num_beams 1
