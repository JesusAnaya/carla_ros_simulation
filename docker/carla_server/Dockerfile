FROM carlasim/carla:0.9.15

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update && \
    apt-get install -y \
    xdg-user-dirs \
    wget \
    && rm -rf /var/lib/apt/lists/*

USER carla

WORKDIR /home/carla/Import

RUN wget https://carla-releases.s3.us-east-005.backblazeb2.com/Linux/AdditionalMaps_0.9.15.tar.gz

WORKDIR /home/carla

RUN /bin/bash ImportAssets.sh

RUN rm ./Import/AdditionalMaps_0.9.15.tar.gz

CMD ["/bin/bash"]