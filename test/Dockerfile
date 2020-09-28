FROM ubuntu:18.04

ENV VIVADO_VERSION=2019.1
ARG VNC_PASSWORD="password"

RUN apt-get update \
    && apt-get -y upgrade \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential default-jre xorg libxrender-dev libxtst-dev vnc4server twm vim sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV DISPLAY :0
ENV GEOMETRY 1920x1200
