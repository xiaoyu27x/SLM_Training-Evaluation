#!/usr/bin/env bash
set -e
cd /data/nanoGPT
source .venv/bin/activate

python train.py config/train_gpt2_v100.py --out_dir=out-owt-2h --max_iters=6000 --lr_decay_iters=6000 --warmup_iters=300 --eval_interval=100 --eval_iters=50 --log_interval=10
python train.py config/train_gpt2_v100.py --out_dir=out-owt-1h --max_iters=3000 --lr_decay_iters=3000 --warmup_iters=150 --eval_interval=100 --eval_iters=50 --log_interval=10
python train.py config/train_gpt2_v100.py --out_dir=out-owt-30m --max_iters=1500 --lr_decay_iters=1500 --warmup_iters=75 --eval_interval=100 --eval_iters=50 --log_interval=10
python train.py config/train_gpt2_v100.py --out_dir=out-owt-10m --max_iters=500 --lr_decay_iters=500 --warmup_iters=25 --eval_interval=100 --eval_iters=50 --log_interval=10
