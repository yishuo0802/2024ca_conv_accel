import numpy as np

def tile_matrix(matrix, tile_dir, tile_size):
    """
    Tile the input matrix into smaller matrices based on tile_dir and tile_size.

    Args:
        matrix (np.ndarray): Input 2D matrix to be tiled.
        tile_dir (str): Direction of tiling ('row' or 'col').
        tile_size (int): Size of each tile along the specified direction.

    Returns:
        np.ndarray: A 3D array where each slice along the third dimension is a tile.
    """
    if not isinstance(matrix, np.ndarray):
        raise ValueError("Input matrix must be a numpy array.")

    if tile_dir not in ('row', 'col'):
        raise ValueError("tile_dir must be either 'row' or 'col'.")

    if not isinstance(tile_size, int) or tile_size <= 0:
        raise ValueError("tile_size must be a positive integer.")

    if tile_dir == 'row':
        if matrix.shape[0] % tile_size != 0:
            raise ValueError("Number of rows is not divisible by tile_size.")

        num_tiles = matrix.shape[0] // tile_size
        tiled = matrix.reshape(num_tiles, tile_size, matrix.shape[1])
        return tiled

    elif tile_dir == 'col':
        if matrix.shape[1] % tile_size != 0:
            raise ValueError("Number of columns is not divisible by tile_size.")
        print("matrix shape", matrix.shape)
        num_tiles = matrix.shape[1] // tile_size
        tiled = matrix.reshape(matrix.shape[0], num_tiles, tile_size).transpose(1, 0, 2)
        return tiled

# Example Usage
# matrix = np.arange(32).reshape(4, 8)
# print("Input Matrix:")
# print(matrix)
# row_tiled = tile_matrix(matrix, 'row', 2)``
# print("\nRow Tiled Matrix:")
# print(row_tiled)

# col_tiled = tile_matrix(matrix, 'col', 2)
# print("\nColumn Tiled Matrix:")
# print(col_tiled)
