#!/bin/bash
set -e

source /opt/ros/$ROS_DISTRO/setup.bash
source /opt/carla-ros-bridge/install/local_setup.bash

exec "$@"
