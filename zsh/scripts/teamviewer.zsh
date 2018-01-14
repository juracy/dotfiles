teamviewer-service() {
    X_DOCKER_AUTH=/tmp/.docker.xauth
    touch ${X_DOCKER_AUTH}
    xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f ${X_DOCKER_AUTH} nmerge -
    docker run -d -e DISPLAY -e XAUTHORITY=${XAUTHORITY} -v /tmp/.X11-unix:/tmp/.X11-unix hurricane/teamviewer
}

teamviewer() {
    CONTAINER=$(docker container list -q --filter "ancestor=hurricane/teamviewer")
    docker exec $CONTAINER teamviewer
}
