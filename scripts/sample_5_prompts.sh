#!/usr/bin/env bash
set -e
cd /data/nanoGPT
source .venv/bin/activate
mkdir -p eval_results
for MODEL in out-owt-10m out-owt-30m out-owt-1h out-owt-2h; do
  for PROMPT_ID in 1 2 3 4 5; do
    case $PROMPT_ID in
      1) PROMPT="Paris is the capital of" ;;
      2) PROMPT="A computer processor is responsible for" ;;
      3) PROMPT="The history of artificial intelligence began" ;;
      4) PROMPT="The scientist opened the door and discovered" ;;
      5) PROMPT="Machine learning is a method that allows computers to" ;;
    esac
    python sample.py --out_dir="$MODEL" --device=cuda --start="$PROMPT" --num_samples=1 --max_new_tokens=150 --temperature=0.8 --top_k=200 | tee "eval_results/${MODEL}_prompt${PROMPT_ID}.txt"
  done
done
