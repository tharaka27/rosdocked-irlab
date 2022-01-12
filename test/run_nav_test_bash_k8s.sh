#!/usr/bin/env bash
export IMAGE=robopaas/rosdocked-noetic-k8s:latest


export CONTAINER_NAME=nav_test_k8s
echo $CONTAINER_NAME

docker run -d -i --name $CONTAINER_NAME $IMAGE  /bin/bash

# TEST #1: testing navigation stack
# test with bash
echo "Testing navigation stack..."
docker exec -i $CONTAINER_NAME ./catkin_ws/src/icclab_summit_xl/.ci/nav_test_bash.sh
if [[ "$?" == "0" ]] ; then
  echo "Navigation test failed. Check output."
  echo "Killing docker container $CONTAINER_NAME..."
  docker kill $CONTAINER_NAME
  docker rm $CONTAINER_NAME
  exit 1
elif [[ "$?" == "1" ]] ; then
  echo "Navigation test succeeded! No issues found."
  echo "Killing docker container $CONTAINER_NAME..."
  docker kill $CONTAINER_NAME
  docker rm $CONTAINER_NAME
  exit 0
else
  echo "State of test unknown. Check output."
  echo "Killing docker container $CONTAINER_NAME..."
  docker kill $CONTAINER_NAME
  docker rm $CONTAINER_NAME
  exit 1
fi
