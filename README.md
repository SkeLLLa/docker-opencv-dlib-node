# docker-opencv-dlib-node

Docker image with compiled OpenCV, Dlib and Node.js

[![](https://images.microbadger.com/badges/version/m03geek/opencv-dlib-node:alpine.svg)](https://microbadger.com/images/m03geek/opencv-dlib-node:alpine "version")[![](https://images.microbadger.com/badges/image/m03geek/opencv-dlib-node:alpine.svg)](https://microbadger.com/images/m03geek/opencv-dlib-node:alpine "layers")

[![](https://images.microbadger.com/badges/version/m03geek/opencv-dlib-node:stretch.svg)](https://microbadger.com/images/m03geek/opencv-dlib-node:stretch "version")[![](https://images.microbadger.com/badges/image/m03geek/opencv-dlib-node:stretch.svg)](https://microbadger.com/images/m03geek/opencv-dlib-node:stretch "layers")

Based on [opencv-dlib image](https://hub.docker.com/r/m03geek/opencv-dlib/)

# Versions (latest)

* node - 10.2.1
* dlib - 19.8
* opencv - 3.4.1

# Notes

If you want to use some native modules you'll need to install at least `python`.

So you can add following lines to your dockerfile.

## Alpine 

For alpine you will also need `libstdc++` for building native modules.

```Dockerfile
RUN apk add --virtual .build-deps python libstdc++ gcc g++
```

Also you may need `libc6-compat` if your native modules will use glibc.

After bould you may want ot delete build deps in order to reduce image size.

```Dockerfile
RUN apk del .build-deps
```

> Remember: you'll need to delete them in one layer with adding them or use `--squash` to reduce actual size.

## Stretch (debian)

```Dockerfile
RUN apt-get update && apt-get install -y --no-install-recommends python build-essential
```

# Node.js lib compatibility

* [opencv4nodejs](https://www.npmjs.com/package/opencv4nodejs) - native module, see installing instructions above and follow module documentation.
* [face-recognition](https://www.npmjs.com/package/face-recognition) - native module, see installing instructions above and follow module documentation.

## Installing opencv4nodejs

```Dockerfile
FROM m03geek/opencv-dlib-node:alpine
RUN apk update && apk add -u --no-cache python make g++
RUN npm i opencv4nodejs
```

## Installing face-recognition

```Dockerfile
FROM m03geek/opencv-dlib-node:alpine
RUN apk update && apk add -u python make g++ libpng-dev libjpeg-turbo-dev giflib-dev libx11-dev
RUN npm init -y
RUN npm i face-recognition
```

# Other images:

## Without FFmpeg

| OpenCV | Dlib | OpenCV+Dlib | OpenCV+Dlib+Node.js | OpenCV+Node.js | Dlib+Node.js |
|-|-|-|-|-|-|
| [Docker](https://hub.docker.com/r/m03geek/opencv/) | [Docker](https://hub.docker.com/r/m03geek/dlib/) | [Docker](https://hub.docker.com/r/m03geek/opencv-dlib/) | [Docker](https://hub.docker.com/r/m03geek/opencv-dlib-node/) | [Docker](https://hub.docker.com/r/m03geek/opencv-node/) | [Docker](https://hub.docker.com/r/m03geek/dlib-node/) |
| [Github](https://github.com/SkeLLLa/docker-opencv) | [Github](https://github.com/SkeLLLa/docker-dlib) | [Github](https://github.com/SkeLLLa/docker-opencv-dlib) | [Github](https://github.com/SkeLLLa/docker-opencv-dlib-node) | [Github](https://github.com/SkeLLLa/docker-opencv-node) | [Github](https://github.com/SkeLLLa/docker-dlib-node) |

## With FFmpeg

| OpenCV | OpenCV+Dlib | OpenCV+Dlib+Node.js | OpenCV+Node.js |
|-|-|-|-|
| [Docker](https://hub.docker.com/r/m03geek/ffmpeg-opencv/) | [Docker](https://hub.docker.com/r/m03geek/ffmpeg-opencv-dlib/) | [Docker](https://hub.docker.com/r/m03geek/ffmpeg-opencv-dlib-node/) | [Docker](https://hub.docker.com/r/m03geek/ffmpeg-opencv-dlib-node/) |
| [Github](https://github.com/SkeLLLa/docker-ffmpeg-opencv) | [Github](https://github.com/SkeLLLa/docker-ffmpeg-opencv) | [Github](https://github.com/SkeLLLa/docker-ffmpeg-opencv-dlib-node) | [Github](https://github.com/SkeLLLa/docker-ffmpeg-opencv-node) |