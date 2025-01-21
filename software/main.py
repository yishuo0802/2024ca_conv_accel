from pathlib import Path

from model import VGG8Bn
from model.qconfig import CustomQConfig
from utils import load_model
from utils.img2col import img2col
from utils.matrix_tile import tile_matrix
import numpy as np

# path = "./weights/cifar10/alexnet/alexnetbn_v2-power2.pt"
# model = load_model(VGG8Bn(), path, qconfig=CustomQConfig.POWER2.value, fuse_modules=True)
# print(model)

def read_file(file_path):
    file_path = Path(file_path)
    if not file_path.exists():
        raise FileNotFoundError(f"File {file_path} not found")
    
    with open(file_path, "r") as file:
        lines = file.readlines()
        shape = [int(i) for i in lines[0].replace("torch.Size([", "").replace("])", "").split(", ")]
        values = lines[3:]
    
    return shape, values

def send_tile_matrix(file_path):
    # Read the ifmap file
    shape, values = read_file(f'{file_path}.i.txt')
    
    # Convert data to list and flatten
    values = [list(map(int, filter(None, line.strip().split(";")))) for line in values if line.strip()]
    flattened_values = [val for sublist in values for val in sublist]
    # Convert to numpy array
    ifmap = np.array(flattened_values, dtype=np.uint8).reshape(*shape[1:])
    # Read the weight file
    shape, values = read_file(f'{file_path}.w.txt')

    # Convert data to list and flatten
    values = [list(map(int, filter(None, line.strip().split(";")))) for line in values if line.strip()]
    flattened_values = [val for sublist in values for val in sublist]
    # Convert to numpy array
    weight = np.array(flattened_values, dtype=np.int8).reshape(*shape)

    ifmap_col, weight_col = img2col(ifmap, weight, stride=1, padding=1)
    ifmap_col_tile = tile_matrix(ifmap_col, 8, 8)
    weight_col_tile = tile_matrix(weight_col, 8, 8)

    return ifmap_col_tile, weight_col_tile

    

ifmap_col_tile, weight_col_tile = send_tile_matrix("./dump_data/conv1.0")
print(len(ifmap_col_tile[0][0]), len(weight_col_tile))