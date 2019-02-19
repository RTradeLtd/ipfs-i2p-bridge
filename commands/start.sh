#! /usr/bin/env bash

. commands/network.sh

countdown() {
    l="30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0"
    echo "Giving the network time to start up."
    for i in $l; do
        echo -n "$i... "
        sleep 1
    done
}

starti2p(){
    createnetwork
    docker run --detach \
        --ip 172.92.92.2 \
        --name "i2pbridge" \
        --hostname "i2pbridge" \
        --network $NETWORK_NAME \
        --volume i2p:/var/lib/i2p:Z \
        $(whoami)/i2p.ipfs; true
    docker start i2pbridge
    echo "Starting i2p"
    countdown
}

startipfs(){
    createnetwork
    docker run --detach \
        --name "ipfsbridge-$BRIDGE_NODE_ID" \
        --hostname "ipfsbridge-$BRIDGE_NODE_ID" \
        --network $NETWORK_NAME \
        $(whoami)/ipfs.i2p
    docker start "ipfsbridge-$BRIDGE_NODE_ID"
    countdown
}

start(){
    starti2p
    startipfs
}
