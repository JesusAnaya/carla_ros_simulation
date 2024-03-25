#!/bin/bash
set -e

source /opt/ros/humble/setup.bash
source /opt/carla-ros-bridge/install/local_setup.bash

exec "$@"
