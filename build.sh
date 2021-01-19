#!/bin/bash

set -ex -o pipefail

export DOCKER_BUILDKIT=1

docker build common --target base -t ffddorf/workadventure-base
docker build common --target proto -t ffddorf/workadventure-proto

docker build nodejs -t ffddorf/workadventure-back --build-arg SERVICE=back --build-arg BASE_LAYER=proto
docker build nodejs -t ffddorf/workadventure-pusher --build-arg SERVICE=pusher --build-arg BASE_LAYER=proto
docker build nodejs -t ffddorf/workadventure-uploader --build-arg SERVICE=uploader

docker build front -t ffddorf/workadventure-front
