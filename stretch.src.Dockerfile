FROM m03geek/opencv-dlib:stretch

ARG RUNTIME_DEPS='ca-certificates'
ARG BUILD_DEPS='apt-utils wget xz-utils cmake build-essential pkg-config'
ARG NODE_VERSION

ENV NODE_VERSION=${NODE_VERSION}

RUN echo "Node.js: ${NODE_VERSION}" \
    && apt-get update && apt-get install -y ${BUILD_DEPS} ${RUNTIME_DEPS} --no-install-recommends \
    && wget https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}.tar.xz -O node.tar.xz \
    && mkdir /node \
    && tar -xJf node.tar.xz --strip 1 -C /node \
    && cd /node \
    && ./configure --prefix=/usr ${CONFIG_FLAGS} \
    && make -j$(getconf _NPROCESSORS_ONLN) \
    && make install \
    && cd / \
    && rm node.tar.xz \
    && rm -rf /node \
    && npm install -g npm@$latest \
    && find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf \
    && apt-get purge -y --auto-remove $BUILD_DEPS \
    && apt-get autoremove -y --purge \
    && apt-get install -y $RUNTIME_DEPS --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* /usr/share/man /usr/local/share/man /tmp/*
