## software install
pacman -S nvidia cuda python-pytorch-cuda

## rebuild initramfs so modules load next time on
mkinitcpio -P

## verify driver working
nvidia-smi

## cuda-samples
pacman -Qqs gcc
make HOST_COMPILER=g++-13

## three pieces of software must be compatible with each other versionwise
## 1. nvidia drivers (from the nvidia package)
## 2. gcc compiler
## 3. cuda framework
## https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html
