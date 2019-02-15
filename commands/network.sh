#! /usr/bin/env sh

createnetwork(){
    docker network create --subnet 172.92.92.0/24 $NETWORK_NAME; true
}

destroynetwork(){
    docker network rm $NETWORK_NAME
}
