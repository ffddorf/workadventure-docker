ARG NODEJS_VERSION=14.15

FROM node:${NODEJS_VERSION} AS base
ARG GIT_REF=master
RUN git clone https://github.com/ffddorf/workadventure.git --depth=1 --branch ${GIT_REF} --single-branch /src/workadventure
WORKDIR /src/workadventure

FROM base AS proto
WORKDIR /src/workadventure/messages
RUN yarn install
RUN yarn run proto-all
