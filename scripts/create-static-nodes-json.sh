#!/bin/bash
cd ../
export PATH=$(pwd)/quorum/build/bin:$PATH
mkdir -p quorum/fromscratch
cd quorum/fromscratch

function createStaticNodesJsonFile() {
  echo "[" >static-nodes.json
  length=$(cat enodes | wc -l)
  addresses=$(cat enodes)

  # create static-nodes.json file
  i=0
  for address in $addresses; do
    port=$((21000 + i))
    raftport=$((50000 + i))
    if [ $i -ne $((length - 1)) ]; then
      suffix=","
    else
      suffix=""
    fi
    echo "  \"enode://${address}@127.0.0.1:${port}?discport=0&raftport=${raftport}\"${suffix}" >>static-nodes.json
    ((i = i + 1))
  done
  echo "]" >>static-nodes.json
}

function copyStaticNodesJsonFileToEachNode() {
  # copy static-nodes.json to each dir
  i=1
  while [ -d "node${i}" ]; do
    cp static-nodes.json "node${i}/"
    ((i = i + 1))
  done
}

createStaticNodesJsonFile
copyStaticNodesJsonFileToEachNode
