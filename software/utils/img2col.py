import numpy as np


def img2col(ifmap, filter, stride=1, padding=0):
    # Get dimensions
    C, H, W = ifmap.shape
    M, _, R, S = filter.shape
    # Calculate output dimensions
    E = (H + 2 * padding - R) // stride + 1
    F = (W + 2 * padding - S) // stride + 1

    # Apply padding to the input feature map
    ifmap_padded = np.pad(
        ifmap, ((0, 0), (padding, padding), (padding, padding)), mode="constant"
    )

    # Initialize the column matrix
    ifmap_col = np.zeros((E * F, R * S * C))

    # Fill the column matrix
    row_idx = 0
    for y in range(0, H + 2 * padding - R + 1, stride):
        for x in range(0, W + 2 * padding - S + 1, stride):
            patch = ifmap_padded[:, y : y + R, x : x + S]
            # print("patch: \n", patch)
            # print("patch flattened: \n", patch.flatten())
            ifmap_col[row_idx, :] = patch.flatten().reshape(1, -1)
            row_idx += 1

    # Reshape filter
    filter_col = filter.reshape(R * S * C, -1)

    return ifmap_col, filter_col


ifmap = np.arange(4 * 8 * 8, dtype=int).reshape(
    4, 8, 8
)  # Sequential values for easy debugging
filter = np.arange(4 * 4 * 3 * 3, dtype=int).reshape(
    4, 4, 3, 3
)  # Sequential values for easy debugging
stride = 1
padding = 1

# print("ifmap", ifmap)
# print("filter", filter)
ifmap_col, filter_col = img2col(ifmap, filter, stride, padding)
# print("ifmap flattened:", ifmap_col)
# Write the ifmap_col to a file='%d')

# # Save the 3D ifmap to a text file
# with open("ifmap.txt", "w") as f:
#     for channel in ifmap:
#         np.savetxt(f, channel, fmt="%d")
#         f.write("\n")  # Add a newline to separate channels

# np.savetxt("ifmap_col.txt", ifmap_col, fmt="%d")
