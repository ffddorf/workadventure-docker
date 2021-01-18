FROM ffddorf/workadventure-proto AS builder

WORKDIR /src/workadventure/front
RUN yarn install --frozen-lockfile
RUN yarn build

FROM nginx:alpine

COPY --from=builder /src/workadventure/front/dist /usr/share/nginx/html
