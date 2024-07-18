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
## https://stackoverflow.com/questions/60987997/why-torch-cuda-is-available-returns-false-even-after-installing-pytorch-with
## https://forums.developer.nvidia.com/t/older-versions-of-cuda/108163
## https://discuss.pytorch.org/t/is-there-a-table-which-shows-the-supported-cuda-version-for-every-pytorch-version/105846


## for cuda 11.8 on ubuntu 20.04
## https://developer.nvidia.com/cuda-11-8-0-download-archive?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=20.04&target_type=deb_local

## all versions archives
## https://developer.nvidia.com/cuda-toolkit-archive
## https://developer.download.nvidia.cn/compute/cuda/repos/debian12/x86_64/

## libcuda1 issue 
## https://forums.developer.nvidia.com/t/nvidia-smi-shows-cuda-version-n-a/170644
## libcuda.so.<driver-version> is part of libcuda1 on debian, nvidia-utils on arch
## https://docs.nvidia.com/deploy/cuda-compatibility/index.html

## cuda uninstall
## https://forums.developer.nvidia.com/t/how-to-uninstall-cuda-toolkit-and-cudnn-under-linux/47923
## https://stackoverflow.com/questions/56431461/how-to-remove-cuda-completely-from-ubuntu
