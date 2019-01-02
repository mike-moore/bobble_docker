#!/bin/bash
set -e

source /opt/ros/melodic/setup.bash
source /bobble_ws/devel/setup.bash


exec "$@"
