# Small Language Model Training and Evaluation Report

## Objective

This experiment studies how training compute affects a 124M-parameter small language model under fixed hardware, dataset, tokenizer, and architecture settings. Four training budgets were compared: 10 minutes, 30 minutes, 60 minutes, and 120 minutes.

## Quantitative Results

| Training Time | Iter | Tokens (M) | Train Loss | Val Loss | Gap | PPL |
|---|---:|---:|---:|---:|---:|---:|
| 10 min | 500 | 30.72 | 4.9903 | 5.1484 | 0.1581 | 172.16 |
| 30 min | 1500 | 92.16 | 4.1537 | 4.4982 | 0.3445 | 89.86 |
| 60 min | 3000 | 184.32 | 3.3508 | 4.2640 | 0.9132 | 71.09 |
| 120 min | 6000 | 368.64 | 2.1496 | 4.9558 | 2.8062 | 142.00 |

## Human Evaluation Results

| Training Time | Coherence | Relevance | Fluency | Factuality | Overall |
|---|---:|---:|---:|---:|---:|
| 10 min | 4 | 4 | 5 | 3 | 4 |
| 30 min | 7 | 5 | 5 | 3 | 5 |
| 60 min | 8 | 7 | 9 | 3 | 6.75 |
| 120 min | 8 | 7 | 9 | 3 | 6.75 |

## Conclusion

Training from 10 to 60 minutes improved validation loss, perplexity, and generation quality. Extending training to 120 minutes continued to reduce training loss, but validation loss and perplexity worsened significantly. The large train-validation gap at 120 minutes indicates overfitting under the fixed OpenWebText 20K subset.
