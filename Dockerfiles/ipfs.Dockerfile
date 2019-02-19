FROM alpine:edge
ENV GOPATH=/opt/
ENV PATH="/opt/bin:/bin:/usr/bin:/usr/local/bin:/sbin/:/usr/sbin/"
ENV IPFS_PATH="/home/ipfs/"

RUN apk update
#RUN apk search thread; false
RUN apk add go git make gcc musl-dev musl-utils
RUN git clone https://github.com/RTradeLtd/go-ipfs-plugin-i2p-gateway \
    /opt/src/github.com/RTradeLtd/go-ipfs-plugin-i2p-gateway -b swarm
RUN go get -u github.com/golang/dep/cmd/dep
WORKDIR /opt/src/github.com/RTradeLtd/go-ipfs-plugin-i2p-gateway
RUN ls -lah
RUN make gx
RUN make vendor
RUN make build
RUN adduser -h /home/ipfs/ -g 'ipfs,,,,' -D ipfs
WORKDIR /home/ipfs
RUN ipfs init
RUN cat config
CMD ipfs daemon
