
use_message="
ipfs-i2p-bridge
===============

This is a mechanism for automatically installing, updating, and
maintaining an ipfs-gateway-over-i2p. It's really just a bunch of functions for
controlling some Docker containers running standard applications with wierd
settings in an intuitive way. In the case of i2p, it installs a standard java
i2p docker container, then modifies it to enable the SAM bridge. In the case of
ipfs, it builds IPFS from the sources used in go-ipfs-plugin-i2p-gateway,
usually the master branch. In a version or so, we'll be able to track successive
releases instead.

In order to pass it a command, simply run

        ./ipfs-i2p-bridge [command]

So to install and run a bridge with the default settings in one line, you just

        ./ipfs-i2p-bridge install run

All the commands:
-----------------

        installi2p - Install customized Java I2P Docker image from
          rtradetech/ipfs-i2p-bridge:i2p
        installipfs - Install customized go-ipfs Docker image from
          rtradetech/ipfs-i2p-bridge:ipfs
        install - Run both installi2p and installipfs
        update - Pull sources from github and run install

        createnetwork - Set up a docker network just for I2P and IPFS containers
        destroynetwork - Tear down the docker network for I2P and IPFS
          containers

        countdown - Count down for 30 seconds to give services time to start
        starti2p - Start i2p application in the container and countdown
        startipfs - Start go-ipfs application in the container and countdown
        start - Run both starti2p and startipfs

        stopi2p - Stop the i2p container
        stopipfs - Stop the go-ipfs container
        stop - Run both stopi2p and stopipfs

        removei2p - Remove the i2p container
        removeipfs - Remove the go-ipfs container
        remove - Run both removei2p and removeipfs

        cleanupi2p - Remove the i2p image and it's volume
        cleanupipfs - Remove the go-ipfs image and it's volume
        cleanup - Run both cleanupi2p and cleanupipfs

Multihoming:
------------


"

usage(){
    echo "$use_message"
}
