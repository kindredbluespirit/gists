#!/usr/bin/env sh

## pull docker image
# podman pull docker.io/ros:noetic
podman pull docker.io/osrf/ros:noetic-desktop-full

## list images
podman image list

## run image as container
podman run -it ros:noetic-desktop-full

## list containers (including the stopped ones)
podman container list --all

## start and attach to the container
## a - attach
## i - interactive
## l - latest
podman container start -ail
# podman container start -ai _TAB_container-name

## add bash session
podman container exec -til bash
# podman container exec -ti _TAB_container-name

################################
## optional, not necessary

## pause container (
## doesn't work for us, simply freezes the terminal, 
## container is destroyed anyway when the terminal 
## is killed)
podman container pause _TAB_container-name

## checkpoint and restore container
podman container checkpoint _TAB_container-name
podman container restore _TAB_container-name

## save container as image (not necessary)
podman container commit _TAB_container-name

##############################
## on the container

## source the ros setup script for every new shell
.  /opt/ros/noetic/setup.bash

## set the catkin workspace only once
pushd
mkdir -p catkin_ws/src
pushd catkin_ws
catkin_make
popd

## once for every shell
.  ~/catkin_ws/devel/setup.bash

## optionally append the setup scripts to ~/.bashrc
echo "
.  /opt/ros/noetic/setup.bash
.  ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
