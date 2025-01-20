import argparse
import os
import sys
from typing import Optional

import torch
import torch.ao.nn.quantized as nnq
import torch.nn as nn
from tqdm import tqdm

from model import VGG8Bn
from model.qconfig import CustomQConfig
from utils import load_model, get_cifar10_loaders


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("model_path", type=str, help="Path to the model")
    parser.add_argument(
        "dump_dir",
        type=str,
        nargs="?",
        default="../../dump",
        help="Path to the dump directory",
    )
    parser.add_argument("-v", "--verbose", action="store_true", help="Verbose output")
    return parser.parse_args()


def extract_all_tensors(model, x, y):
    tensors = {}
    module_name = {}

    def dump_layer(m, i, o):
        tensors[f"{module_name[m]}.i"] = i[0]
        tensors[f"{module_name[m]}.o"] = o
        if hasattr(m, "weight"):
            tensors[f"{module_name[m]}.w"] = m.weight()
        if hasattr(m, "bias"):
            tensors[f"{module_name[m]}.b"] = m.bias()

    for name, module in model.named_modules():
        if isinstance(module, (nnq.Conv2d, nnq.Linear, nn.MaxPool2d)):
            module_name[module] = name
            module.register_forward_hook(dump_layer)

    print(model(x), y)
    return tensors


def dump_4d_array(
    tensor: torch.Tensor, path: Optional[str] = None, quant: bool = True
) -> None:
    if path is None:
        file = sys.stdout
    else:
        os.makedirs(os.path.dirname(path), exist_ok=True)
        file = open(path, "w")

    tensor = tensor.reshape(*([1] * (4 - tensor.dim())), *tensor.shape)

    print(tensor.shape, file=file)
    if quant:
        if hasattr(tensor, "q_scale"):
            print(tensor.q_scale(), file=file)
        if hasattr(tensor, "q_zero_point"):
            print(tensor.q_zero_point(), file=file)
    for n in tensor:
        for c in n:
            for h in c:
                for w in h:
                    if quant:
                        print(w.int_repr().item(), end=";", file=file)
                    else:
                        print(w.item(), end=";", file=file)
                print(file=file)


def main():
    args = parse_args()

    model = load_model(
        VGG8Bn(),
        args.model_path,
        qconfig=CustomQConfig.POWER2.value,
        fuse_modules=True,
    )
    if args.verbose:
        print(model)

    *_, test_loader = get_cifar10_loaders(batch_size=1)
    x, y = next(iter(test_loader))
    tensors = extract_all_tensors(model, x, y)

    for name, tensor in tqdm(tensors.items()):
        name = name.replace("module.", "")
        quant = not name.endswith(".b")
        dump_4d_array(tensor, path=f"{args.dump_dir}/{name}.txt", quant=quant)


if __name__ == "__main__":
    main()
