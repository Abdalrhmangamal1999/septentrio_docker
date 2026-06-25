FROM ros:jazzy-ros-base

ENV DEBIAN_FRONTEND=noninteractive
ENV ROS_DISTRO=jazzy

RUN apt-get update && apt-get install -y \
    ros-jazzy-septentrio-gnss-driver \
    ros-jazzy-rmw-fastrtps-cpp \
    gettext-base \
    && rm -rf /var/lib/apt/lists/*


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
