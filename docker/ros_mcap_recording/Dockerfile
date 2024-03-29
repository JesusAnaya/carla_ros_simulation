FROM carla_ros_bridge:latest as bridge
FROM control_steering_wheel:latest as control_steering_wheel
FROM ros:humble-ros-base-jammy

ENV CARLA_VERSION=0.9.15
ENV ROS_DISTRO=humble

# Combine RUN instructions to reduce layers and fix empty continuation line warning
RUN apt update && apt install -y \
    ros-humble-derived-object-msgs \
    ros-humble-ackermann-msgs \
    ros-humble-rosbag2-storage-mcap \
    && rm -rf /var/lib/apt/lists/*

COPY --from=bridge /opt/carla-ros-bridge/install /opt/carla-ros-bridge/install
COPY --from=control_steering_wheel /opt/control_steering_wheel/install /opt/control_steering_wheel/install

COPY docker/ros_mcap_recording/ros_entrypoint.sh /
COPY docker/ros_mcap_recording/run_recording.sh /

# Ensure script is executable
RUN chmod +x /ros_entrypoint.sh
RUN chmod +x /run_recording.sh

WORKDIR /home/recording

ENTRYPOINT ["/ros_entrypoint.sh"]
