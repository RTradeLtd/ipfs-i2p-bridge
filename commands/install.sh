#! /usr/bin/env sh

installi2p(){
    docker build $NO_USE_CACHE \
        --file Dockerfiles/i2p.Dockerfile \
        --tag $(whoami)/i2p.ipfs .
}

installipfs(){
    docker build $NO_USE_CACHE \
        --file Dockerfiles/ipfs.Dockerfile \
        --tag $(whoami)/ipfs.i2p .
}

install(){
    installi2p
    installipfs
}

update(){
    NO_USE_CACHE="--no-cache"
    git pull
    install
}
