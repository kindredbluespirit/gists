## software install
pacman -S nvidia cuda python-pytorch-cuda

## rebuild initramfs
mkinitcpio -P

## verify driver working
nvidia-smi

## cuda-samples
pacman -Qqs gcc
make HOST_COMPILER=g++-13
