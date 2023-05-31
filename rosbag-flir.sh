#!/usr/bin/env sh

## update package list
apt update

## install the required packages
apt install \
  ros-noetic-derived-object-msgs \
  ros-noetic-vision-msgs \
  ros-noetic-rader-msgs \
  ros-noetic-dbw-mkz-msgs

## get the bag files from aws
## https://s3.console.aws.amazon.com/s3/buckets/miscellaneous-datasets?prefix=FlirApril2023%2F

## begin ros server
roscore

## catkin make
cd <path-to-smartmicro>
rm -rf build devel
catkin_make

## run the python scripts
python <path-to-smartmicro>/src/radar_object_converter/umrrll_object_converter.py
python <path-to-smartmicro>/custom_scripts/pointcloud_z_filter.py

## rosbag filter
rosbag filter <input-bag-from-aws> <intermediate-bag> m

## convert intermediate bag to reversed output, change names in the python script
python <path-to-smartmicro>/custom_scripts/reverse_bag.py


## setup shell
. <path-to-setup.sh>

## add node
rosrun fusion aeb_visualizer_node

## list nodes, must show aeb_visualizer_node
rosnode list

## rosbag visualizer
rosbag play -l <path-to-bag>.bag

## add lidar, radar, visible image, thermal image
