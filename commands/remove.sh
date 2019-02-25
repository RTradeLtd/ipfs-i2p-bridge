#! /usr/bin/env sh

removei2p(){
    docker rm -f i2pbridge; true
}

removeipfs(){
    docker rm -f "ipfsbridge-$BRIDGE_NODE_ID"; true
}

remove(){
    removei2p
    removeipfs
}
