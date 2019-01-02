#!/bin/bash
set -e

source /usr/share/gazebo/setup.sh
source /opt/ros/melodic/setup.bash
source /bobble_ws/devel/setup.bash
pkill -f gz*


exec "$@"
