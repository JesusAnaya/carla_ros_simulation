FROM carlasim/carla:0.9.15 as carla
FROM ros:humble-ros-base-jammy as base

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip

RUN pip3 install carla==0.9.15

COPY --from=carla /home/carla/PythonAPI /opt/carla/PythonAPI
RUN rm /opt/carla/PythonAPI/examples/requirements.txt
COPY requirements.txt /opt/carla/PythonAPI/examples/requirements.txt

WORKDIR /opt/carla/PythonAPI/examples

RUN pip3 install -r /opt/carla/PythonAPI/examples/requirements.txt

COPY ./config/wheel_config.ini /opt/carla/PythonAPI/examples/wheel_config.ini

CMD python3 manual_control_steeringwheel.py --host carla_server --port 2000
