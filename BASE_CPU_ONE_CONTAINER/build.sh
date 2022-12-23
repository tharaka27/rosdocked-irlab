#!/usr/bin/env bash

################################################################################
# ZHAW INIT
# Description:  Dockerfile to create the Base CPU Docker image
# Authors:      Leonardo Militano, Mark Straub, Giovanni Toffetti
# Date:         2021-11-08
################################################################################

export ROS_DISTRO=humble
export IMAGE_NAME=robopaas/rosdocked-${ROS_DISTRO}-robopaas-base-cpu:latest

# Get this script's path
pushd `dirname $0` > /dev/null
SCRIPTPATH=`pwd`
popd > /dev/null

# Build the docker image
docker build \
  --build-arg user=$USER\
  --build-arg home=/home/ros \
  --build-arg workspace=/home/ros \
  --build-arg shell=$SHELL\
  --build-arg uid=$UID\
  -t $IMAGE_NAME .
