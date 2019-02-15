#! /usr/bin/env sh

createnetwork(){
    docker network create $NETWORK_NAME; true
}

destroynetwork(){
    docker network rm $NETWORK_NAME
}
