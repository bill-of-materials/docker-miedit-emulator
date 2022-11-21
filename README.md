# Alpine miedit emulator

![GitHub commits since tagged version](https://img.shields.io/github/commits-since/Zigazou/miedit/25a6074?label=commits%20on%20miedit%20repo%20since%20last%20build&style=flat-square)


![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/uzer/miedit-emulator/latest?style=flat-square)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/uzer/miedit-emulator/latest?style=flat-square)
![Docker Pulls](https://img.shields.io/docker/pulls/uzer/miedit-emulator?style=flat-square)

This container is almost pointless and just here for conveniency.

It's an nginx server with www directory populated with miedit emulator files.
There is an entrypoint that will read an environment variable containing a
websocket server URL, and replace it in the emulator http page.

In other words, this container could be considered as a build artifact from a CI
that can be used "as is".

Project URLs:
[Official Website](https://github.com/Zigazou/miedit) |
[Dockerhub](https://hub.docker.com/r/uzer/miedit-emulator) |
[Github (Dockerfiles + Samples)](https://github.com/bill-of-materials/docker-miedit-emulator)


## Usage

```
docker run -e MINITEL_SERVER="ws://3611.re/ws" --rm -it uzer/miedit-emulator:latest
```
