#! /usr/bin/env sh

cleanupi2p(){
    docker rmi -f $(whoami)/i2p.ipfs; true
}

cleanupipfs(){
    docker rmi -f $(whoami)/ipfs.i2p; true
}

cleanup(){
    cleanupi2p
    cleanupipfs
}
