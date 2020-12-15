#!/bin/bash
export PATH=$(pwd)/quorum/build/bin:$PATH

pushd quorum/fromscratch
bootnode --genkey=nodekey
cp nodekey node1/
bootnode --nodekey=node1/nodekey --writeaddress > node1/enode
address=$(cat node1/enode)
touch static-nodes.json
cat <<EOF > static-nodes.json
[
  "enode://${address}@127.0.0.1:21000?discport=0&raftport=50000"
]
EOF
cp static-nodes.json node1
