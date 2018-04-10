# docker-opencv-dlib

Docker image with compiled OpenCV, Dlib and Node.js

Based on [opencv-dlib image](https://hub.docker.com/r/m03geek/opencv-dlib/)

# Notes

If you want to use some native modules you'll need to install at least `python`.

So you can add following lines to your dockerfile.

## Alpine 

For alpine you will also need `libstdc++` for building native modules.

```Dockerfile
RUN apk add --virtual .build-deps python libstdc++
```

Also you may need `libc6-compat` if your native modules will use glibc.

After bould you may want ot delete build deps in order to reduce image size.

```Dockerfile
RUN apk del .build-deps
```

> Remember: you'll need to delete them in one layer with adding them or use `--squash` to reduce actual size.

## Stretch (debian)

```Dockerfile
RUN apt-get update && apt-get install -y --no-install-recommends python
```

# Other images:

## Without FFmpeg

| OpenCV | OpenCV+Dlib | OpenCV+Dlib+Node.js |
|-|-|-|
| [Docker](https://hub.docker.com/r/m03geek/opencv/) | [Docker](https://hub.docker.com/r/m03geek/opencv-dlib/) | [Docker](https://hub.docker.com/r/m03geek/opencv-dlib-node/) |
| [Github](https://github.com/SkeLLLa/docker-opencv) | [Github](https://github.com/SkeLLLa/docker-opencv-dlib) | [Github](https://github.com/SkeLLLa/docker-opencv-dlib-node) |

## With FFmpeg

| OpenCV | OpenCV+Dlib | OpenCV+Dlib+Node.js |
|-|-|-|
| [Docker](https://hub.docker.com/r/m03geek/ffmpeg-opencv/) | [Docker](https://hub.docker.com/r/m03geek/ffmpeg-opencv-dlib/) | [Docker](https://hub.docker.com/r/m03geek/ffmpeg-opencv-dlib-node/) |
| [Github](https://github.com/SkeLLLa/docker-ffmpeg-opencv) | [Github](https://github.com/SkeLLLa/docker-ffmpeg-opencv-dlib) | [Github](https://github.com/SkeLLLa/docker-ffmpeg-opencv-dlib-node) |