import numpy as np
import os

def tile_and_save_matrix(matrix, tile_row_size, tile_col_size, output_dir, file_prefix):
    """
    Split a large matrix into multiple sub-matrices and save them as TXT files.
    
    Parameters:
    - matrix: np.ndarray, the large matrix
    - tile_row_size: int, the row size of the sub-matrix
    - tile_col_size: int, the column size of the sub-matrix
    - output_dir: str, the output directory path to store the sub-matrices
    - file_prefix: str, the prefix for the output file names
    """
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    
    rows, cols = matrix.shape
    tile_count = 0  # Used to mark the tile number
    
    # Traverse the large matrix and split into sub-matrices
    for row_start in range(0, rows, tile_row_size):
        for col_start in range(0, cols, tile_col_size):
            # Calculate the actual size of the current tile
            row_end = min(row_start + tile_row_size, rows)
            col_end = min(col_start + tile_col_size, cols)
            
            # Extract the sub-matrix
            sub_matrix = matrix[row_start:row_end, col_start:col_end]
            
            # Save the sub-matrix as a TXT file
            file_name = f"{file_prefix}_tile_{tile_count}_rows_{row_start}_{row_end}_cols_{col_start}_{col_end}.txt"
            file_path = os.path.join(output_dir, file_name)
            np.savetxt(file_path, sub_matrix, delimiter=",")
            print(f"Saved: {file_path}")
            
            tile_count += 1

def process_layer_files(layer, input_dir, output_dir, tile_row_size, tile_col_size):
    """
    Process the input files for a specific layer and save the tiled matrices.
    
    Parameters:
    - layer: int, the layer number
    - input_dir: str, the input directory path containing the files
    - output_dir: str, the base output directory path
    - tile_row_size: int, the row size of the sub-matrix
    - tile_col_size: int, the column size of the sub-matrix
    """
    layer_input_dir = os.path.join(input_dir, f"layer{layer}")
    layer_output_dir = os.path.join(output_dir, f"layer_{layer}")
    
    ifmap_file = os.path.join(layer_input_dir, f"layer{layer}_ifmap_img2col.txt")
    filter_file = os.path.join(layer_input_dir, f"layer{layer}_filter_img2col.txt")
    
    if os.path.exists(ifmap_file) and os.path.exists(filter_file):
        ifmap_matrix = np.loadtxt(ifmap_file, delimiter=",")
        filter_matrix = np.loadtxt(filter_file, delimiter=",")
        
        tile_and_save_matrix(ifmap_matrix, tile_row_size, tile_col_size, layer_output_dir, f"layer{layer}_ifmap")
        tile_and_save_matrix(filter_matrix, tile_row_size, tile_col_size, layer_output_dir, f"layer{layer}_filter")
    else:
        print(f"Files for layer {layer} not found in {layer_input_dir}")

# Parameters
input_directory = "/path/to/input/directory"  # Change this to your input directory path
output_directory = "../data/"
tile_row_size = 8  # Maximum number of rows in the sub-matrix
tile_col_size = 8  # Maximum number of columns in the sub-matrix

# Process layers
for layer in range(1, 6):
    process_layer_files(layer, input_directory, output_directory, tile_row_size, tile_col_size)
