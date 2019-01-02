# Bobble-Bot Simulator Docker Image
> Containerized environment for the Bobble-Bot Gazebo simulation.


<a href="http://www.youtube.com/watch?feature=player_embedded&v=hS7kfhN-8V8" 
target="_blank"><img src="imgs/BobbleBotGazebo.png" 
alt="BobbleBot Simulation" width="840" height="380" border="1" /></a>


The simulation graphics also work within the container. For that,  an NVidia GPU 
is required.
See [nvidia-docker](https://github.com/NVIDIA/nvidia-docker) and follow the installation 
steps on that page first.


Launch the simulator 
```sh
git clone https://github.com/super-owesome/bobble_docker.git
cd bobble_docker
docker pull superowesome/bobble-sim:latest
./run_bobble_sim.bash
```

Consult the [bobble_controllers](https://github.com/super-owesome/bobble_controllers) repository for instructions
on getting started with the simulation.
