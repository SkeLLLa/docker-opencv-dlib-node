ARG VERSION
FROM mhart/alpine-node:${VERSION} as nodebase

FROM m03geek/opencv-dlib:alpine
ENV OPENCV4NODEJS_DISABLE_AUTOBUILD=1

COPY --from=nodebase /usr/bin/node /usr/bin/
COPY --from=nodebase /usr/lib/libgcc* /usr/lib/libstdc* /usr/lib/
COPY --from=nodebase /usr/include/* /usr/include/
