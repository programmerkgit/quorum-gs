#!/bin/bash
cd ../
export PATH=$(pwd)/quorum/build/bin:$PATH
cd quorum/fromscratch

echo "chose node to start up"
select nodedir in */; do
  number=$(echo $nodedir | tr -dc '0-9')
  i=$((number - 1))
  port=$((21000 + i))
  raftport=$((50000 + i))
  rpcport=$((22000 + i))
  break
done

PRIVATE_CONFIG=ignore nohup geth --datadir $nodedir \
  --nodiscover --verbosity 5 --networkid 31337 --raft --raftport $raftport \
  --rpc --rpcaddr 0.0.0.0 --rpcport $rpcport --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum,raft \
  --emitcheckpoints --allow-insecure-unlock --port $port >>"$nodedir/node.log" 2>&1 &
