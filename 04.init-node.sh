#!/bin/bash
pushd quorum/fromscratch
geth --datadir node1 init genesis.json
popd
