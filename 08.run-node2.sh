#!/bin/bash
pushd quorum/fromscratch
geth --datadir node2 init genesis.json
PRIVATE_CONFIG=ignore nohup geth --datadir node2 --nodiscover --verbosity 5 --networkid 31337 --raft --raftport 50001 --raftjoinexisting 2 --rpc --rpcaddr 0.0.0.0 --rpcport 22001 --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum,raft --emitcheckpoints --port 21001 >>node2.log 2>&1 &
popd
