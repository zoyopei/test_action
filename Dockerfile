FROM ubuntu:20.04

RUN apt-get update -y && apt-get install -y wget
RUN wget https://golang.google.cn/dl/go1.21.10.linux-arm64.tar.gz
RUN rm -rf /usr/local/go && tar -C /usr/local -xzf go1.21.10.linux-arm64.tar.gz
ENV PATH=/usr/local/go/bin:$PATH

ADD . /test_action
WORKDIR /test_action

RUN go build
