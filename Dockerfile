# syntax=docker/dockerfile:1.6

FROM ubuntu:22.04

LABEL org.opencontainers.image.authors="4097471+pythoninthegrass@users.noreply.github.com"
LABEL org.opencontainers.image.url="https://github.com/pythoninthegrass/static-cross-bins"

RUN apt -qq update && apt -qq install \
    --no-install-recommends -y \
    autoconf \
    automake \
    bison \
    bzip2 \
    flex \
    g++ \
    gcc \
    gzip \
    libtool \
    make \
    patch \
    tar \
    wget \
    xz-utils \
    && rm -rf /var/lib/apt/lists/*

WORKDIR "/build"
COPY "Makefile" "/build/"
COPY "include" "/build/include"
VOLUME "/build"

ENTRYPOINT ["/usr/bin/make", "-w"]
