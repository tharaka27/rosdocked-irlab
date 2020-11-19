FROM osrf/ros:eloquent-desktop

RUN apt update &&  \
apt-get install -y wget unzip ros-eloquent-rviz2 ros-eloquent-rqt-image-view libconsole-bridge-dev ros-eloquent-gazebo-ros-pkgs ros-eloquent-ros-core ros-eloquent-geometry2 ros-eloquent-gazebo-ros-pkgs ros-eloquent-cartographer ros-eloquent-cartographer-ros ros-eloquent-navigation2 ros-eloquent-nav2-bringup  && \
rm -rf /var/lib/apt/lists/*

# fix missing libconsole_bridge.so.1.0
RUN cd /opt ; wget https://github.com/ros/console_bridge/archive/1.0.1.zip ; \
unzip 1.0.1.zip ; cd console_bridge-1.0.1 ; \
cmake -DCMAKE_INSTALL_PREFIX=/opt/ros/foxy/ ; make ; make install

ENV user=ros

# add ros user to container and make sudoer
RUN useradd -m -s /bin/bash -G video,plugdev  ${user} && \
echo "${user} ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/${user}" && \
chmod 0440 "/etc/sudoers.d/${user}"

# add user to video group
RUN adduser ${user} video
RUN adduser ${user} plugdev

# Switch to user
USER "${user}"

# edit bashrc
RUN echo "source opt/ros/eloquent/setup.bash" >> ~/.bashrc

# launch rviz2 package
CMD ["ros2", "run", "rviz2", "rviz2"]
