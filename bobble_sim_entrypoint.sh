#!/bin/bash
set -e

source /opt/ros/melodic/setup.bash
source /bobble_workspace/install/setup.bash


exec "$@"
