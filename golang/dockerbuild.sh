#!/bin/sh

export DOCKER_BUILDKIT=1

TAG="dcard/protoc:3.14.0-golang-1.16.0"

docker buildx build --push --platform=linux/amd64,linux/arm64 -t $TAG .
