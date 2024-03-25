FROM carla_ros_bridge:latest as bridge

FROM ros:humble-ros-base-jammy

ENV ROS_DISTRO=humble

RUN apt update && apt install -y \
    ros-humble-foxglove-bridge \
    ros-humble-derived-object-msgs \
    ros-humble-ackermann-msgs \
    && rm -rf /var/lib/apt/lists/*

COPY --from=bridge /opt/carla-ros-bridge/install /opt/carla-ros-bridge/install

COPY ros_entrypoint.sh /

# Ensure script is executable
RUN ["sudo", "chmod", "+x", "/ros_entrypoint.sh"]

ENTRYPOINT ["/ros_entrypoint.sh"]
