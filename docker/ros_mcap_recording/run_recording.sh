#!/usr/bin/env bash

current_datetime=$(date +"%Y-%m-%dT%H-%M-%S")

ros2 bag record -s mcap -o ./redosding_${current_datetime}.mcap \
    /carla/ego_vehicle/rgb_center/image /carla/ego_vehicle/rgb_center/camera_info \
    /carla/ego_vehicle/rgb_left/image /carla/ego_vehicle/rgb_left/camera_info \
    /carla/ego_vehicle/rgb_right/image /carla/ego_vehicle/rgb_right/camera_info \
    /carla/ego_vehicle/vehicle_status