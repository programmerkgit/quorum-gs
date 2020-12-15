#!/bin/bash
export PATH=$(pwd)/quorum/build/bin:$PATH
./02.create-node.sh
./03.set-nodekey-and-static-nodes.json.sh
./04.init-node.sh
