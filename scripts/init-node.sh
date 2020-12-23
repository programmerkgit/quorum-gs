#!/bin/bash
datadir=$1
cd ../
export PATH=$(pwd)/quorum/build/bin:$PATH
mkdir -p quorum/fromscratch
cd quorum/fromscratch
echo $datadir
geth --datadir "$datadir" init genesis.json
