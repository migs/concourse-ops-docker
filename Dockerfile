FROM golang:1.11-alpine

ENV CONCOURSE_VERSION 4.2.1

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    git

# Install fly
RUN wget https://github.com/concourse/concourse/releases/download/v${CONCOURSE_VERSION}/fly_linux_amd64 && \
    chmod +x fly_linux_amd64 && \
    mv fly_linux_amd64 /usr/bin/fly

# Install stopover
RUN go get \
    github.com/EngineerBetter/stopover
