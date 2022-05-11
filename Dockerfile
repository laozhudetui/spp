FROM golang AS build-env

RUN GO111MODULE=off go get -u github.com/esrrhs/spp
RUN GO111MODULE=off go get -u github.com/esrrhs/spp/...
RUN GO111MODULE=off go install github.com/esrrhs/spp

FROM debian:11
COPY --from=build-env /go/bin/spp .
WORKDIR ./
