#! /usr/bin/env sh

stopi2p(){
    stopipfs
    docker stop $(whoami)/i2p.ipfs
}

stopipfs(){
    docker stop $(whoami)/ipfs.i2p
}

stop(){
    stopipfs
    stopi2p
}
