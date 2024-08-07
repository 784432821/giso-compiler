FROM ubuntu:22.04

LABEL maintainer="giso build" \
    description="giso Docker image"

# 修改root用户密码为root
RUN echo "root:root"|chpasswd

WORKDIR /root

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
RUN sed -i s@/archive.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g /etc/apt/sources.list

RUN apt-get clean
RUN apt-get update
RUN apt-get install -y make cmake python3 
RUN apt-get install -y python3-pip
RUN pip3 install meson ninja pyelftools -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com

RUN apt-get install -y pkg-config curl wget

RUN wget -P /data/toolchain/ https://releases.linaro.org/components/toolchain/binaries/7.2-2017.11/aarch64-linux-gnu/gcc-linaro-7.2.1-2017.11-x86_64_aarch64-linux-gnu.tar.xz

RUN tar -xf /data/toolchain/gcc-linaro-7.2.1-2017.11-x86_64_aarch64-linux-gnu.tar.xz -C /data/toolchain/

RUN alias ll="ls -l"
RUN mkdir -p /data/toolchain/setenv
RUN echo '#!/bin/sh' > /data/toolchain/setenv/setenv_linaro_7.2.1 && \
    echo 'ARCH=arm64' >> /data/toolchain/setenv/setenv_linaro_7.2.1 && \
    echo 'CROSS_COMPILE=aarch64-linux-gnu-' >> /data/toolchain/setenv/setenv_linaro_7.2.1 && \
    echo 'PATH=/data/toolchain/gcc-linaro-7.2.1-2017.11-x86_64_aarch64-linux-gnu/bin:$PATH' >> /data/toolchain/setenv/setenv_linaro_7.2.1 && \
    echo 'export CROSS_COMPILE ARCH' >> /data/toolchain/setenv/setenv_linaro_7.2.1
