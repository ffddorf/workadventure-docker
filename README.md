# Docker Images of Workadventure

This contains configuration to build very opinionated Docker images for the software [WorkAdventure](https://github.com/thecodingmachine/workadventure).

## Building locally

```sh
./build.sh
```

These images are being built:
- `ffddorf/workadventure-back` - backend logic
- `ffddorf/workadventure-pusher` - handles websockets
- `ffddorf/workadventure-uploader` - service for uploading files
- `ffddorf/workadventure-front` - frontend webapp, served via nginx
