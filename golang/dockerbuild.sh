#!/bin/sh

export DOCKER_BUILDKIT=1

BASE="dcard/protoc:3.14.0-golang-1.15.7"
AMD64="$BASE-amd64"
ARM64="$BASE-arm64"

docker buildx build --platform=linux/amd64 --build-arg ARCH=x86_64 -t $AMD64 .
docker buildx build --platform=linux/arm64 --build-arg ARCH=aarch_64 -t $ARM64 .
docker push $AMD64
docker push $ARM64
docker manifest create $BASE $AMD64 $ARM64
docker manifest push $BASE