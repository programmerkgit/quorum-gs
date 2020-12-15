#!/bin/bash
cd ../
export PATH=$(pwd)/quorum/build/bin:$PATH
mkdir -p quorum/fromscratch
cd quorum/fromscratch

i=1
while [ -d "node${i}" ]; do
  geth --datadir "node${i}" init genesis.json
  ((i = i + 1))
done
