ARG NODEJS_VERSION=14.15

FROM node:${NODEJS_VERSION} AS base
ARG GIT_REF=master
RUN git clone https://github.com/thecodingmachine/workadventure.git --depth=1 --branch ${GIT_REF} --single-branch /src/workadventure
WORKDIR /src/workadventure

FROM base AS proto
WORKDIR /src/workadventure/messages
RUN yarn install
RUN yarn run proto

# BACK
FROM proto AS back-builder

WORKDIR /src/workadventure/back
COPY --from=proto /src/workadventure/messages/generated ./src/Messages/generated

ENV NODE_ENV=development
RUN yarn install --frozen-lockfile
RUN yarn tsc

FROM node:${NODEJS_VERSION}-slim AS back

WORKDIR /app
COPY --from=base /src/workadventure/back/package.json /src/workadventure/back/yarn.lock /app/

ENV NODE_ENV=production
RUN yarn install --production --frozen-lockfile

COPY --from=back-builder /src/workadventure/back/dist/ /app/

ENTRYPOINT [ "node", "--max-old-space-size=4096", "/app/server.js" ]
