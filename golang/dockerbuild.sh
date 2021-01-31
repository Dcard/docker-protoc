#!/bin/sh

export DOCKER_BUILDKIT=1

TAG="dcard/protoc:3.14.0-golang-1.15.7"

docker buildx build --push --platform=linux/amd64,linux/arm64 -t $TAG .
