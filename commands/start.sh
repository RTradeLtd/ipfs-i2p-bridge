#! /usr/bin/env bash

countdown() {
    l="30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0"
    for i in $l; do
        echo $i
    done
}

starti2p(){
    docker run --detatch \
        --network $NETWORK_NAME \
        --volume i2p:/var/lib/i2p:Z \
        $(whoami)/i2p.ipfs
    countdown
}

startipfs(){
    docker run \
        --network $NETWORK_NAME \
        $(whoami)/ipfs.i2p
}

start(){
    starti2p
    startipfs
}
