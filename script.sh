#!/bin/bash

if [[ ! -f Dockerfile ]]
then
        echo "Dockerfile not found: please enter a subdir with a dockerfile and run script from there"
        exit
fi

source ../global-vars
source vars
VERSION=$(cat VERSION)

echo "dollar zero is $(basename $0)"

buildme () {
  set -x -v
  docker build -t ${REGISTRY}/${CONTAINER_NAME}:${VERSION} .
  set +x +v
}

pushme () {
  set -x -v
  docker push ${REGISTRY}/${CONTAINER_NAME}:${VERSION}
  set +x +v
}

case $(basename $0) in
  build.sh)
    buildme
  ;;
  push.sh)
    pushme
  ;;
esac
