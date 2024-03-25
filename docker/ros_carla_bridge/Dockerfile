FROM carlasim/carla:0.9.15 as carla

FROM ros:humble-ros-base-jammy

ENV CARLA_VERSION=0.9.15
ENV ROS_DISTRO=humble
ENV CARLA_VERSION=$CARLA_VERSION
ENV DEBIAN_FRONTEND=noninteractive
ENV ROS_PYTHON_VERSION=3
ENV ROS_VERSION=2

WORKDIR /opt/carla-ros-bridge

# TODO: Check versions, should support up to CARLA 0.9.13
RUN git clone --recurse-submodules --branch feature/u22-0.9.15 https://github.com/pradhanshrijal/ros-bridge.git src/

COPY --from=carla /home/carla/PythonAPI /opt/carla/PythonAPI

RUN cp ./src/requirements.txt /opt/carla-ros-bridge
RUN cp ./src/install_dependencies.sh /opt/carla-ros-bridge

RUN apt update && apt install -y \
    ros-$ROS_DISTRO-rviz2 \
    ros-$ROS_DISTRO-derived-object-msgs \
    ros-$ROS_DISTRO-ackermann-msgs \
    python3-pip

RUN pip3 install --upgrade pip

RUN rosdep update 
RUN rosdep install --from-paths src --ignore-src -r -y

RUN /bin/bash -c 'source /opt/ros/$ROS_DISTRO/setup.bash; \
    bash /opt/carla-ros-bridge/install_dependencies.sh; \
    echo "export PYTHONPATH=\$PYTHONPATH:/opt/carla/PythonAPI/carla/dist/$(ls /opt/carla/PythonAPI/carla/dist | grep py$ROS_PYTHON_VERSION.)" >> /opt/carla/setup.bash; \
    echo "export PYTHONPATH=\$PYTHONPATH:/opt/carla/PythonAPI/carla" >> /opt/carla/setup.bash'

RUN /bin/bash -c 'source /opt/ros/$ROS_DISTRO/setup.bash; \
    colcon build'

RUN pip3 install carla==$CARLA_VERSION

COPY ros_entrypoint.sh /

# Ensure script is executable
RUN ["sudo", "chmod", "+x", "/ros_entrypoint.sh"]

ENTRYPOINT ["/ros_entrypoint.sh"]
