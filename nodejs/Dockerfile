ARG NODEJS_VERSION=14.15
ARG BASE_LAYER=base

FROM workadventure-base AS base

FROM workadventure-${BASE_LAYER} AS builder
ARG SERVICE
WORKDIR /src/workadventure/${SERVICE}
ENV NODE_ENV=development
RUN yarn install --frozen-lockfile
RUN yarn tsc

FROM node:${NODEJS_VERSION}-slim
ARG SERVICE

WORKDIR /app
COPY --from=base /src/workadventure/${SERVICE}/package.json /src/workadventure/${SERVICE}/yarn.lock /app/

ENV NODE_ENV=production
RUN yarn install --production --frozen-lockfile

COPY --from=builder /src/workadventure/${SERVICE}/dist/ /app/

ENTRYPOINT [ "node", "--max-old-space-size=4096", "/app/server.js" ]
