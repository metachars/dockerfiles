
DOCKER_BASE=metachars

CUR_DIR="$(cd "$(dirname "$0")" >/dev/null 2>&1; pwd -P)"
DOCKER_IMAGE=$(basename $CUR_DIR)
DOCKER_TAG=daily
DOCKER_NAME="${DOCKER_IMAGE}"

function build_img()
{
    docker build --network=host -t ${DOCKER_BASE}/${DOCKER_IMAGE}:${DOCKER_TAG} .
}

function push_img()
{
    docker push ${DOCKER_BASE}/${DOCKER_IMAGE}:${DOCKER_TAG}
}

function pull_img()
{
    docker pull ${DOCKER_BASE}/${DOCKER_IMAGE}:${DOCKER_TAG}
}

function usage_container()
{
    echo "Usage: sudo $0 {login|build|push|pull|start|stop|clean|reset|att|logs}"
    exit 1
}

function stop_container()
{
    docker stop ${DOCKER_NAME}$1
}

function clean_container()
{
    docker rm -f -v ${DOCKER_NAME}$1
}

function att_container()
{
    docker exec -it ${DOCKER_NAME}$1 bash
}

function logs_container()
{
    docker logs ${DOCKER_NAME}$1
}

function docker_main()
{

    case "$1" in
    login)
        docker login --username= reg.docker.alibaba-inc.com
        ;;
    start)
        start_${DOCKER_IMAGE} $2
        ;;
    stop)
        stop_container $2
        ;;
    clean)
        clean_container $2
        ;;
    reset)
        stop_container $2
        clean_container $2
        start_${DOCKER_IMAGE} $2
        ;;
    att)
        att_container $2
        ;;
    logs)
        logs_container $2
        ;;
    build)
        build_img
        ;;
    push)
        push_img
        ;;
    pull)
        pull_img
        ;;
    *)
        usage_container
        ;;
    esac
}
