# Docker Images of Workadventure

This contains configuration to build very opinionated Docker images for the software [WorkAdventure](https://github.com/thecodingmachine/workadventure).

## Building locally

```sh
export DOCKER_BUILDKIT=1
docker build . --target <target>
```

These targets are available:
- `back` - the backend service
- _more to come..._
