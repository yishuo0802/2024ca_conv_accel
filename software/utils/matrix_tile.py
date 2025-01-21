import numpy as np
import logging

# Configure logging
# logging.basicConfig(filename='matrix_tile.log', level=logging.INFO, format='%(message)s')

def tile_matrix(matrix, tile_row_size, tile_col_size):
    """
    Split a large matrix into multiple sub-matrices.
    
    Parameters:
    - matrix: np.ndarray, the large matrix
    - tile_row_size: int, the row size of the sub-matrix
    - tile_col_size: int, the column size of the sub-matrix

    Returns:
    - List of np.ndarray, the tiled sub-matrices
    """
    rows, cols = matrix.shape
    tiled_matrices = []

    # Traverse the large matrix and split into sub-matrices
    for row_start in range(0, rows, tile_row_size):
        row_tiles = []
        for col_start in range(0, cols, tile_col_size):
            # Calculate the actual size of the current tile
            row_end = min(row_start + tile_row_size, rows)
            col_end = min(col_start + tile_col_size, cols)
            
            # Extract the sub-matrix
            sub_matrix = matrix[row_start:row_end, col_start:col_end]
            row_tiles.append(sub_matrix)
        tiled_matrices.append(row_tiles)

    return tiled_matrices

# # Example usage
# if __name__ == "__main__":
#     # Example input matrices
#     matrix_a = np.arange(20 * 16, dtype=np.uint8).reshape(20, 16)
#     matrix_b = np.arange(16 * 12, dtype=np.int8).reshape(16, 12)
    
#     # Tiling parameters
#     tile_row_size = 8
#     tile_col_size = 8

#     # Tile the matrices
#     tiled_matrix_a = tile_matrix(matrix_a, tile_row_size, tile_col_size)
#     tiled_matrix_b = tile_matrix(matrix_b, tile_row_size, tile_col_size)

#     # logging.info("-------------------------------------------------")
#     # logging.info("Number of tiles for A")
#     # logging.info("num_row_tile: %d num_col_tile: %d", len(tiled_matrix_a), len(tiled_matrix_a[0]))
#     # logging.info("-------------------------------------------------")
#     # logging.info("Number of tiles for B: %d", len(tiled_matrix_b))
#     # logging.info("num_row_tile: %d num_col_tile: %d", len(tiled_matrix_b), len(tiled_matrix_b[0]))
#     # logging.info("-------------------------------------------------")

#     # Reconstruct matrices from tiles and verify correctness
#     reconstructed_a = np.block([
#         [tiled_matrix_a[i][j] for j in range(len(tiled_matrix_a[0]))]
#         for i in range(len(tiled_matrix_a))
#     ])

#     reconstructed_b = np.block([
#         [tiled_matrix_b[i][j] for j in range(len(tiled_matrix_b[0]))]
#         for i in range(len(tiled_matrix_b))
#     ])

#     result_original = np.dot(matrix_a, matrix_b)
#     result_tiled = np.dot(reconstructed_a, reconstructed_b)

#     # logging.info("Original matrix multiplication result:")
#     # logging.info(result_original)
#     # logging.info("Tiled matrix multiplication result:")
#     # logging.info(result_tiled)

#     # Verify correctness
#     assert np.array_equal(result_original, result_tiled), "Results do not match!"
#     # logging.info("Verification passed: Tiled multiplication matches original multiplication.")
#     print("Verification passed: Tiled multiplication matches original multiplication.")
