#!/bin/sh

export DOCKER_BUILDKIT=1

docker buildx build --push --platform=linux/amd64 --build-arg ARCH=x86_64 -t dcard/protoc:3.14.0-golang-1.15.7 .
docker buildx build --push --platform=linux/arm64 --build-arg ARCH=aarch_64 -t dcard/protoc:3.14.0-golang-1.15.7 .