FROM golang:1.11.4 AS build
RUN go get -d -u github.com/golang/protobuf/protoc-gen-go && git -C /go/src/github.com/golang/protobuf checkout v1.2.0
RUN go get -d -u github.com/gogo/protobuf/protoc-gen-gogo && git -C /go/src/github.com/gogo/protobuf checkout v1.2.0
RUN go install github.com/golang/protobuf/protoc-gen-go
RUN go install github.com/gogo/protobuf/protoc-gen-gogo
RUN go install github.com/gogo/protobuf/protoc-gen-gofast
RUN go install github.com/gogo/protobuf/protoc-gen-gogofast
RUN go install github.com/gogo/protobuf/protoc-gen-gogofaster
RUN go install github.com/gogo/protobuf/protoc-gen-gogoslick
RUN wget https://github.com/protocolbuffers/protobuf/releases/download/v3.6.1/protoc-3.6.1-linux-x86_64.zip
RUN apt-get update && apt-get install unzip
RUN unzip protoc-3.6.1-linux-x86_64.zip -d /protoc

FROM gcr.io/distroless/base:debug
COPY --from=build /go/bin/protoc-gen-* /bin/
COPY --from=build /protoc/ /usr
