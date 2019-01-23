FROM osrf/ros:melodic-desktop-full

ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

RUN apt-get update && apt-get install -y apt-utils build-essential psmisc vim-gtk

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get install -q -y python-catkin-tools

RUN apt-get update && apt-get install -q -y ros-melodic-hector-gazebo-plugins

# Install git lfs. Necessary in order to properly clone bobble_description
RUN echo 'deb http://http.debian.net/debian wheezy-backports main' > /etc/apt/sources.list.d/wheezy-backports-main.list
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
RUN apt-get install -q -y git-lfs
RUN git lfs install

ENV BOBBLE_WS=/bobble_workspace

RUN source /opt/ros/melodic/setup.bash && \
    mkdir -p $BOBBLE_WS/src && \
    cd $BOBBLE_WS/src && \
    catkin_init_workspace && \
    git clone https://github.com/super-owesome/bobble_controllers.git && \
    git clone https://github.com/super-owesome/bobble_description.git && \
    cd $BOBBLE_WS && \
    catkin_make && \
    catkin_make install

# Required python packages for analysis
RUN \
  apt-get install -y python-pip && \
  pip install matplotlib==2.0.2 && \
  pip install numpy && \
  pip install scipy && \
  pip install jupyter && \
  pip install seaborn && \
  pip install pandas && \
  pip install bokeh && \
  pip install rosbag_pandas

EXPOSE 11345

COPY ./bobble_sim_entrypoint.sh /

ENTRYPOINT ["/bobble_sim_entrypoint.sh"]

CMD ["bash"]