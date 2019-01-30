FROM golang:1.11.4 AS build
RUN go get github.com/golang/protobuf/protoc-gen-go
RUN go get github.com/gogo/protobuf/protoc-gen-gogo
RUN go get github.com/gogo/protobuf/protoc-gen-gofast
RUN go get github.com/gogo/protobuf/protoc-gen-gogofast
RUN go get github.com/gogo/protobuf/protoc-gen-gogofaster
RUN go get github.com/gogo/protobuf/protoc-gen-gogoslick
RUN wget https://github.com/protocolbuffers/protobuf/releases/download/v3.6.1/protoc-3.6.1-linux-x86_64.zip
RUN apt-get update && apt-get install unzip
RUN unzip protoc-3.6.1-linux-x86_64.zip -d /protoc

FROM gcr.io/distroless/base:debug
COPY --from=build /go/bin/protoc-gen-* /bin/
COPY --from=build /protoc/ /usr
