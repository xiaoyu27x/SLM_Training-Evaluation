# Small Language Model Training and Evaluation

This project documents a controlled small language model experiment using nanoGPT and a GPT-2 124M-style architecture on a single Tesla V100 32GB GPU. The goal is to evaluate how increasing training compute affects convergence and generation quality under fixed model, dataset, tokenizer, and hardware settings.

## Experiment Design

Only the training budget changes across four runs: 10 minutes, 30 minutes, 60 minutes, and 120 minutes. All other core settings are fixed.

| Setting | Value |
|---|---|
| Model | GPT-2 124M style |
| Framework | nanoGPT |
| Dataset | OpenWebText 20K subset |
| GPU | NVIDIA Tesla V100-PCIE-32GB |
| Context length | 1024 |
| Batch size | 12 |
| Gradient accumulation | 5 |
| Tokens per iteration | 61,440 |
| Precision | FP16 |

## Key Result

Validation performance improved from 10 minutes to 60 minutes, but degraded after extending training to 120 minutes. The widening train-validation gap indicates overfitting under the fixed small dataset condition.

## Files

- `results/quantitative_metrics.csv`: train loss, validation loss, perplexity, and training tokens.
- `results/human_evaluation.csv`: human-rated generation quality scores.
- `scripts/train_4_runs.sh`: command template for four training runs.
- `scripts/evaluate_checkpoints.py`: checkpoint metric extraction template.
- `scripts/sample_5_prompts.sh`: standardized generation testing template.
- `docs/experiment_report.md`: concise experiment report.
