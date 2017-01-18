#!/bin/bash

if [[ ! -f Dockerfile ]]
then
        echo "Dockerfile not found: please enter a subdir with a dockerfile and run script from there"
fi

source ../global-vars
source vars
VERSION=$(cat VERSION)

set -x -v
docker build -t ${REGISTRY}/${CONTAINER_NAME}:${VERSION} .
set +x +v

