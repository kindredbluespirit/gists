## software install
pacman -S nvidia cuda python-pytorch-cuda nvidia-container-toolkit

## rebuild initramfs so modules load next time on
mkinitcpio -P

## verify driver working every 0.5 seconds
## https://youtu.be/Wjrdr0NU4Sk?si=GHTHHInt_hJUf9Jv&t=435
watch -n -0.5 nvidia-smi

## cuda-samples
pacman -Qqs gcc
make HOST_COMPILER=g++-13

## three pieces of software must be compatible with each other versionwise
## 1. nvidia drivers (from the nvidia package)
## 2. gcc compiler
## 3. cuda framework
## https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html

## compatibility
## https://stackoverflow.com/questions/60987997/why-torch-cuda-is-available-returns-false-even-after-installing-pytorch-with
