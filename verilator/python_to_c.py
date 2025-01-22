import numpy as np

def generate_4d_array(a):
    # 創建 4 維 Tensor
    print(a)
    tensor1 = np.arange(0, 256).reshape(4, 4, 4, 4).astype(np.uint8)
    tensor2 = np.arange(0, 256).reshape(4, 4, 4, 4).astype(np.int8)
    return tensor1.tolist(), tensor2.tolist()

if __name__ == "__main__":
    a = "example_string"  # Example string
    tensor1, tensor2 = generate_4d_array(a)
    print(tensor1)
    print(tensor2)