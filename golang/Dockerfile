FROM golang:1.12
ADD protoc-3.9.0-linux-x86_64.tar.gz /usr
RUN git config --global url."ssh://git@github.com/".insteadOf "https://github.com/"
RUN echo "Host github.com\n\tStrictHostKeyChecking no\n\tControlMaster auto\n\tControlPersist 600\n\tControlPath /tmp/ssh-%r@%h:%p" >> /etc/ssh/ssh_config