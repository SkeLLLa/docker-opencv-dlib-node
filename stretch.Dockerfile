FROM m03geek/opencv-dlib:stretch

ARG RUNTIME_DEPS=''
ARG BUILD_DEPS='wget xz-utils'
ARG ARCH='x64'
ARG LIB_PREFIX='/usr/local'
ARG NODE_VERSION

ENV NODE_VERSION=${NODE_VERSION}

RUN echo "Node.js: ${NODE_VERSION}" \
    && apt-get update && apt-get install -y ${BUILD_DEPS} ${RUNTIME_DEPS} --no-install-recommends \
    && wget https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-$ARCH.tar.xz -O node.tar.xz \
    && tar -xJf node.tar.xz -C ${LIB_PREFIX} --strip-components=1 --no-same-owner \
    && ln -s ${LIB_PREFIX}/bin/node ${LIB_PREFIX}/bin/nodejs \
    && cd / \
    && rm node.tar.xz \
    && find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf \
    && apt-get purge -y --auto-remove $BUILD_DEPS \
    && apt-get autoremove -y --purge \
    && rm -rf /var/lib/apt/lists/* /usr/share/man /usr/local/share/man /tmp/*
