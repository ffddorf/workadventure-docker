#!/bin/bash

set -ex -o pipefail

export DOCKER_BUILDKIT=1

GIT_REPO="https://github.com/kalkspace/workadventure.git"
GIT_BRANCH="develop"
GIT_COMMIT="HEAD"

IMAGE_PREFIX="quay.io/kalkspace/workadventure"
IMAGE_TAG="local-pusher-2"

docker build common --target base -t "workadventure-base" \
  --build-arg GIT_REPO=${GIT_REPO} --build-arg GIT_BRANCH=${GIT_BRANCH} --build-arg GIT_COMMIT=${GIT_COMMIT}
docker build common --target proto -t "workadventure-proto"

docker build nodejs -t "${IMAGE_PREFIX}-back:${IMAGE_TAG}" --build-arg SERVICE=back --build-arg BASE_LAYER=proto
docker build nodejs -t "${IMAGE_PREFIX}-pusher:${IMAGE_TAG}" --build-arg SERVICE=pusher --build-arg BASE_LAYER=proto
docker build nodejs -t "${IMAGE_PREFIX}-uploader:${IMAGE_TAG}" --build-arg SERVICE=uploader

docker build front -t "${IMAGE_PREFIX}-front:${IMAGE_TAG}"
