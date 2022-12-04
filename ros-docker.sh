#!/bin/sh

## refer to ros-podman for the most part
## docker is just a fallback for podman

## doas for superuser/root access

## build without intermediate images
docker build --rm  -t my-ros .

## remove intermediate "none" images
# docker rmi $(docker images -f “dangling=true” -q)
# docker system prune
docker image prune

## create/run container
docker run -it --rm -e DISPLAY --net=host -v /tmp/.X11-unix:/tmp/.X11-unix my-ros
