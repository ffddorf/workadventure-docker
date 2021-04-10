FROM workadventure-proto AS builder

WORKDIR /src/workadventure/front
RUN yarn install --frozen-lockfile

# Pusher
ENV PUSHER_URL=/pusher

# STUN Server
ENV STUN_SERVER=stun:turn.testadventure.kalk.space

# TURN Server
ENV TURN_SERVER=turn:turn.testadventure.kalk.space
ENV TURN_USER=micky
ENV TURN_PASSWORD=maus

# Jitsi
ENV JITSI_URL=jitsi.freifunk-duesseldorf.de

RUN cp /src/workadventure/front/dist/index.tmpl.html /src/workadventure/front/dist/index.tmpl.html.tmp
RUN yarn build

FROM nginx:alpine

COPY --from=builder /src/workadventure/front/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 8080
