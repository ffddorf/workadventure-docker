#!/bin/bash

set -ex -o pipefail

export DOCKER_BUILDKIT=1

docker build common --tag ffddorf/workadventure-base  --target base
docker build common --tag ffddorf/workadventure-proto --target proto
docker build nodejs --tag quay.io/ffddorf/workadventure-back:latest   --progress=plain --build-arg SERVICE=back   --build-arg BASE_LAYER=proto
docker build nodejs --tag quay.io/ffddorf/workadventure-pusher:latest --progress=plain --build-arg SERVICE=pusher --build-arg BASE_LAYER=proto
docker build front  --tag quay.io/ffddorf/workadventure-front:latest  --progress=plain
# we don't need this service atm
# docker build nodejs --tag quay.io/ffddorf/workadventure-uploader:latest --progress=plain --build-arg SERVICE=uploader
