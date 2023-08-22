#!/bin/sh

## openpcdet #############################

## install nvidia-cuda-toolkit
apt install nvidia-cuda-toolkit
nvcc --version
nvidia-smi

apt install torch torchvision torchaudio

## install spconv
## https://github.com/traveller59/spconv
pip install spconv-cuxx

## install av2, kornia

## docker
podman run -it -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/shared:~/shared image1

## grant gui permission
xhost +

## docker shell setup
podman exec -til bash

## in the container ##################################################

## .bashrc
echo ". /opt/ros/noetic/local_setup.sh" >> ~/.bashrc
