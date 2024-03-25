FROM carla_ros_bridge:latest as bridge

FROM ros:humble-ros-base-jammy

ENV CARLA_VERSION=0.9.15
ENV ROS_DISTRO=humble

# Combine RUN instructions to reduce layers and fix empty continuation line warning
RUN apt update && apt install -y \
    ros-humble-derived-object-msgs \
    ros-humble-ackermann-msgs \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip

# Ensure the /opt/carla-ros-bridge/install exists in the bridge image before copying
COPY --from=bridge /opt/carla-ros-bridge/install /opt/carla-ros-bridge/install
COPY docker/control_steering_wheel/requirements.txt /opt/control_steering_wheel/requirements.txt

WORKDIR /opt/control_steering_wheel
COPY ./src /opt/control_steering_wheel/src

RUN pip3 install -r /opt/control_steering_wheel/requirements.txt
RUN pip3 install carla==$CARLA_VERSION

RUN /bin/bash -c 'source /opt/ros/$ROS_DISTRO/setup.bash; \
    colcon build'

COPY docker/control_steering_wheel/ros_entrypoint.sh /

# Ensure script is executable
RUN chmod +x /ros_entrypoint.sh

ENTRYPOINT ["/ros_entrypoint.sh"]
