#!/bin/sh

export DOCKER_BUILDKIT=1

TAG="dcard/protoc:3.21.9-golang-1.22.2"

[[ -f protoc-21.9-linux-aarch_64.zip ]] || curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v21.9/protoc-21.9-linux-aarch_64.zip
[[ -f protoc-21.9-linux-x86_64.zip ]] || curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v21.9/protoc-21.9-linux-x86_64.zip
mkdir -p linux/arm64 && unzip -o -d linux/arm64 protoc-21.9-linux-aarch_64
mkdir -p linux/amd64 && unzip -o -d linux/amd64 protoc-21.9-linux-x86_64

docker buildx build --push --platform=linux/amd64,linux/arm64 -t $TAG .

rm *.zip
rm -rf linux
