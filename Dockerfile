FROM osrf/ros:melodic-desktop-full

ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

RUN apt-get update && apt-get install -y apt-utils build-essential psmisc

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get install -q -y python-catkin-tools

RUN apt-get update && apt-get install -q -y ros-melodic-hector-gazebo-plugins

ENV BOBBLE_WS=/bobble_ws

RUN mkdir -p $BOBBLE_WS/src

RUN cd $BOBBLE_WS/src && \
    git clone https://github.com/super-owesome/bobble_controllers.git && \
    git clone https://github.com/super-owesome/bobble_description.git

RUN cd $BOBBLE_WS && \
    source /opt/ros/melodic/setup.bash && \
    catkin init ; catkin build

EXPOSE 11345

COPY ./bobble_sim_entrypoint.sh /

ENTRYPOINT ["/bobble_sim_entrypoint.sh"]

CMD ["bash"]