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
    docker run \
        $(whoami)/i2p.ipfs
    countdown 30 "Giving i2p time to bootstrap"
}

startipfs(){
    docker run \
        $(whoami)/ipfs.i2p
}

start(){
    starti2p
    startipfs
}
