ARG NODEJS_VERSION=14.15

FROM node:${NODEJS_VERSION} AS base
ARG GIT_REPO=https://github.com/thecodingmachine/workadventure.git
ARG GIT_BRANCH=develop
ARG GIT_COMMIT=HEAD
RUN git clone ${GIT_REPO} --depth=1 --branch ${GIT_BRANCH} --single-branch /src/workadventure
WORKDIR /src/workadventure
RUN git checkout ${GIT_COMMIT}

FROM base AS proto
WORKDIR /src/workadventure/messages
RUN yarn install
RUN yarn run proto-all
