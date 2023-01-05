################################################################################
# ZHAW INIT
# Description:  Dockerfile to create the Base CPU Docker image
# Authors:      Leonardo Militano, Mark Straub, Giovanni Toffetti
# Date:         2021-11-08
################################################################################

# Base image
FROM ubuntu:22.04


################################################################################
# Arguments
ENV ROS_DISTRO=humble
ENV workspace=/home/ros
ARG user=ros
###############################################################################

# Setup demo environment variables
ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768 

##############################################################################
# Setup locale properly
RUN apt update && sudo apt install locales \
    && locale-gen en_US en_US.UTF-8 \
    && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8


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
      fluxbox \
      xterm \
      xvfb \
      socat \
      ubuntu-mate-desktop

# Clone noVNC from github
RUN git clone https://github.com/kanaka/noVNC.git /root/noVNC \
    && cd /root/noVNC \
    && git checkout stable/v0.6 \
	&& git clone https://github.com/kanaka/websockify /root/noVNC/utils/websockify \
	&& rm -rf /root/noVNC/.git \
	&& rm -rf /root/noVNC/utils/websockify/.git 
	
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf


# Modify the launch script 'ps -p'
RUN sed -i -- "s/ps -p/ps -o pid | grep/g" /root/noVNC/utils/launch.sh

EXPOSE 8080

#CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
