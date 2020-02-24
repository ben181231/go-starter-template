FROM golang:1.13-alpine AS building

RUN \
  apk add --no-cache make

RUN mkdir -p /usr/src/app

COPY . /usr/src/app

WORKDIR /usr/src/app

CMD "make"

FROM alpine:3.11

COPY \
  --from=building \
  /usr/src/app/bin/run \
  /usr/local/bin/run

CMD "run"
