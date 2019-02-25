
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

Multihoming:
------------


"

usage(){
    echo "$use_message"
}
