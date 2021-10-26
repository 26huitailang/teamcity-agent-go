FROM jetbrains/teamcity-minimal-agent:2021.2-linux

USER root

ENV DEBIAN_FRONTEND noninteractive
ENV GOVERSION 1.17.2

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
    echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse" >> /etc/apt/sources.list && \
    echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse" >> /etc/apt/sources.list

RUN apt-get update && apt-get install -qqy vim git wget tar build-essential \
&& wget -q https://studygolang.com/dl/golang/go${GOVERSION}.linux-amd64.tar.gz \
&& tar -xvf go${GOVERSION}.linux-amd64.tar.gz \
&& mv go /usr/local \
&& mkdir -p /opt/gopath

ENV GOROOT="/usr/local/go"
ENV GOPATH="/opt/gopath"
ENV PATH="${GOPATH}/bin:${GOROOT}/bin:${PATH}"