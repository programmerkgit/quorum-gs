#!/bin/bash
export PATH=$(pwd)/quorum/build/bin:$PATH
cd quorum/fromscratch
geth --datadir node1 init genesis.json
