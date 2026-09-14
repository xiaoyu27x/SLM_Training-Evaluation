import math
import torch

TOKENS_PER_ITER = 61440
models = [
    ("10m", "out-owt-10m/ckpt.pt"),
    ("30m", "out-owt-30m/ckpt.pt"),
    ("60m", "out-owt-1h/ckpt.pt"),
    ("2h", "out-owt-2h/ckpt.pt"),
]

print("Model,Iter,Train Tokens M,Best Val Loss,Best PPL")
for name, path in models:
    ckpt = torch.load(path, map_location="cpu")
    it = ckpt["iter_num"]
    val = ckpt["best_val_loss"]
    print(f"{name},{it},{it*TOKENS_PER_ITER/1e6:.2f},{val:.4f},{math.exp(val):.2f}")
