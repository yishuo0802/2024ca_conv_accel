from model import VGG8Bn
from model.qconfig import CustomQConfig
from utils import load_model

path = "./weights/cifar10/alexnet/alexnetbn_v2-power2.pt"
model = load_model(VGG8Bn(), path, qconfig=CustomQConfig.POWER2.value, fuse_modules=True)
print(model)