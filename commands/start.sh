#! /usr/bin/env bash

countdown() {
  secs=$1
  shift
  msg=$@
  while [ $secs -gt 0 ]
  do
    printf "\r\033[KWaiting %.d seconds $msg" $((secs--))
    sleep 1
  done
  echo
}

starti2p(){
    docker run --detatch \
        --network $NETWORK_NAME \
        --volume i2p:/var/lib/i2p:Z \
        $(whoami)/i2p.ipfs
    countdown 30 "Giving i2p time to bootstrap"
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
