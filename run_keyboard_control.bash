docker exec -it \
    bobble_sim_container \
    sh -c "source /opt/ros/melodic/setup.bash; \
           source /bobble_workspace/install/setup.bash; \
           rosrun bobble_controllers KeyboardControl"