
## pull docker image
# podman pull docker.io/ros:noetic
podman pull docker.io/osrf/ros:noetic-desktop-full

## list images
podman image list

## run container
podman run -it ros:noetic-desktop-full
