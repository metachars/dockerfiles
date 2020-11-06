#!/bin/bash

source ../functions.sh

function start_pwn_ubuntu()
{
    DOCKER_INSTANT=$1

    docker run -d -it \
        --name=${DOCKER_NAME}${DOCKER_INSTANT} \
        -e "LD_PRELOAD=$libc" \
        --cap-add=SYS_PTRACE \
        --security-opt seccomp=unconfined \
        --privileged=true \
        "${DOCKER_BASE}/${DOCKER_IMAGE}:${DOCKER_TAG}"
}

docker_main $1 $2