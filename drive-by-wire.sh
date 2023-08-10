#!/bin/sh

. devel/setup.sh

##################################

## ford_urban_ws

python3 ros_init.py params.yaml

rosrun atlas-driver pubGps2Local

roslaunch ford_urban.launch

roslaunch dbw_mkz_can dbw.launch

rostopic pub /vehicle/enable std_msgs/Empty "{}"

###################################

## novatel

roslaunch novatel_oem7_driver oem7_net.launch oem7_ip_addr:=192.168.0.3 oem7_port:=3001

###################################

rviz
