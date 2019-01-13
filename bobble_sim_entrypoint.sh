#!/bin/bash
set -e

source /opt/ros/melodic/setup.bash
source /bobble_ws/install/setup.bash


exec "$@"
