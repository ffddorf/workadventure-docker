FROM ffddorf/workadventure-proto AS builder

WORKDIR /src/workadventure/front
RUN yarn install --frozen-lockfile

# Pusher
ENV PUSHER_URL=/pusher

# STUN Server
ENV STUN_SERVER=stun:stun.freifunk-duesseldorf.de

# TURN Server
ENV TURN_SERVER=turn:stun.freifunk-duesseldorf.de
ENV TURN_USER=foo
ENV TURN_PASSWORD=bar

# Jitsi
ENV JITSI_URL=jitsi.freifunk-duesseldorf.de
ENV START_ROOM_URL=/_/global/chaosdorf.github.io/dorfadventure/main.json

RUN cp /src/workadventure/front/dist/index.tmpl.html /src/workadventure/front/dist/index.tmpl.html.tmp
RUN yarn build

FROM nginx:alpine

COPY --from=builder /src/workadventure/front/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 8080
