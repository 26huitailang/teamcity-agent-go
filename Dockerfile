FROM jetbrains/teamcity-minimal-agent:2021.2-linux

ENV DEBIAN_FRONTEND noninteractive
ENV GOVERSION 1.17.2

RUN apt-get update && apt-get install -qqy vim git wget tar \
&& wget -q https://studygolang.com/dl/golang/go${GOVERSION}.src.tar.gz \
&& tar -xvf go${GOVERSION}.linux-amd64.tar.gz \
&& mv go /usr/local \
&& mkdir -p /opt/gopath

ENV GOROOT="/usr/local/go"
ENV GOPATH="/opt/gopath"
ENV PATH="${GOPATH}/bin:${GOROOT}/bin:${PATH}"