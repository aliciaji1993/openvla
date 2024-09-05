torchrun --standalone --nnodes 1 --nproc-per-node 2 vla-scripts/finetune.py \
  --vla_path "openvla/openvla-7b" \
  --data_root_dir "/media/yufeng/datasets/" \
  --dataset_name sacson \
  --run_root_dir logs/ \
  --adapter_tmp_dir /home/yufeng/.cache/ \
  --lora_rank 32 \
  --batch_size 4 \
  --grad_accumulation_steps 4 \
  --learning_rate 5e-4 \
  --image_aug False \
  --wandb_project ft_openvla \
  --wandb_entity aliciaji1993 \
  --save_steps 100