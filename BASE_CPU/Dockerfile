################################################################################
# ZHAW INIT
# Description:  Dockerfile to create the Base CPU Docker image
# Authors:      Leonardo Militano, Mark Straub, Giovanni Toffetti
# Date:         2021-11-08
################################################################################

# Base image
FROM osrf/ros:humble-desktop


################################################################################
# Arguments
ENV ROS_DISTRO=humble
ENV workspace=/home/ros
ARG user=ros
###############################################################################


# Install git, supervisor, VNC, & X11 packages
RUN set -ex; \
    apt-get update; \
    apt-get install -y \
      bash \
      icewm \
      git \
      net-tools \
      novnc \
      supervisor \
      x11vnc \
      xvfb \
      bash

# Setup demo environment variables
ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768 \
    RUN_XTERM=no \
    RUN_ICEWM=no

COPY . /app

RUN chmod +x /app/entrypoint.sh

CMD ["/app/entrypoint.sh"]
EXPOSE 8080