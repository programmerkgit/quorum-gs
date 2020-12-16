#!/bin/bash
cd ../
export PATH=$(pwd)/quorum/build/bin:$PATH
mkdir -p quorum/fromscratch
cd quorum/fromscratch

function nextNodeDir() {
  i=1
  while [ -d "node${i}" ]; do
    ((i = i + 1))
  done
  echo "node${i}"
}

function addNode() {
  nodedir=$(nextNodeDir)
  mkdir -p "$nodedir"
  bootnode --genkey="${nodedir}/nodekey"
  bootnode --nodekey="${nodedir}/nodekey" --writeaddress >"$nodedir"/enode
  address=$(cat "${nodedir}/enode")
  touch enodes
  echo $address >>enodes
  echo "$nodedir is created"
}
addNode
