XAUTH=/tmp/.docker.xauth
if [ ! -f $XAUTH ]
then
    xauth_list=$(xauth nlist :0 | sed -e 's/^..../ffff/')
    if [ ! -z "$xauth_list" ]
    then
        echo $xauth_list | xauth -f $XAUTH nmerge -
    else
        touch $XAUTH
    fi
    chmod a+r $XAUTH
fi

docker run -it \
    --name="bobble_analysis_container" \
    --volume="`pwd`:/data:rw" \
    superowesome/bobble-sim:stable \
    roslaunch bobble_controllers apply_impulse_force.launch impulse:=-1000 out_file:=/data/impulse_test gui:=true
