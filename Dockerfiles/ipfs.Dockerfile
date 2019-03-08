FROM alpine:edge
ENV GOPATH=/opt/
ENV PATH="/opt/bin:/bin:/usr/bin:/usr/local/bin:/sbin/:/usr/sbin/"
ENV IPFS_PATH="/home/ipfs/"
ARG IPFS_PATH="/home/ipfs/"

RUN apk update
#RUN apk search thread; false
RUN apk add go git make gcc musl-dev musl-utils rsync
RUN go get -u github.com/golang/dep/cmd/dep
RUN git clone https://github.com/RTradeLtd/go-ipfs-plugin-i2p-gateway \
    /opt/src/github.com/RTradeLtd/go-ipfs-plugin-i2p-gateway -b swarm
WORKDIR /opt/src/github.com/RTradeLtd/go-ipfs-plugin-i2p-gateway
RUN make gx vendor build ipfs
RUN adduser -h /home/ipfs/ -g 'ipfs,,,,' -D ipfs
USER ipfs
RUN make install
RUN ls $IPFS_PATH/plugins
WORKDIR /home/ipfs
RUN ipfs init && ipfs init; true
RUN sed -i 's|"SAMHost": "/ip4/127.0.0.1/"|"SAMHost": "/ip4/172.92.92.2/"|g' i2pconfig
RUN cat i2pconfig
CMD ipfs daemon
