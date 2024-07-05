## shell
docker run -it --rm <image-name> /bin/bash

## test nvidia driver
docker run --gpus all --rm nvidia/cuda:12.1.1-runtime-ubuntu22.04 nvidia-smi
