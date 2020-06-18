FROM python:3

ENV FONTFORGE_VERSION=20200314

RUN apt-get update && \
    apt-get install -y \
        libjpeg-dev \
        libtiff5-dev \
        libpng-dev \
        libfreetype6-dev \
        libgif-dev \
        libgtk-3-dev \
        libxml2-dev \
        libpango1.0-dev \
        libcairo2-dev \
        libspiro-dev \
        libuninameslist-dev \
        python3-dev \
        ninja-build \
        cmake \
        build-essential \
        gettext

WORKDIR /opt
RUN curl -LO https://github.com/fontforge/fontforge/archive/${FONTFORGE_VERSION}.tar.gz && \
    tar -xf ${FONTFORGE_VERSION}.tar.gz && \
    cd fontforge-${FONTFORGE_VERSION}/fontforge && \
    mkdir build && \
    cmake -GNinja .. && \
    ninja && \
    ninja install

CMD ./font-patcher
