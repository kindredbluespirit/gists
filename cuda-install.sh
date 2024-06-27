## software install
pacman -S nvidia cuda python-pytorch-cuda

## rebuild initramfs so modules load next time on
mkinitcpio -P

## verify driver working
nvidia-smi

## cuda-samples
pacman -Qqs gcc
make HOST_COMPILER=g++-13
