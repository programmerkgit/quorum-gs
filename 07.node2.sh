#!/bin/bash
export PATH=$(pwd)/quorum/build/bin:$PATH
pushd quorum/fromscratch
mkdir -p node2
bootnode --genkey=nodekey2
cp nodekey2 node2/nodekey
bootnode --nodekey=node2/nodekey --writeaddress > node2/enode
address=$(cat node2/enode)
cp static-nodes.json node2
cat <<EOF >> node2/static-nodes.json
[
  "enode://${address}@127.0.0.1:21001?discport=0&raftport=50001"
]
EOF
popd
