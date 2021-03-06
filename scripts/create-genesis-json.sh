#!/bin/bash
cd ../
export PATH=$(pwd)/quorum/build/bin:$PATH
mkdir -p quorum/fromscratch
cd quorum/fromscratch

function createGenesisFile() {

  echo "Input public address to which initial balance is allocated"
  read address

  if ! [[ $address == 0x* ]]; then
    echo "address should start with 0x"
    exit 1
  fi

  touch genesis.json
  cat <<EOF >genesis.json
  {
    "alloc": {
      "${address}": {
        "balance": "1000000000000000000000000000"
      }
    },
   "coinbase": "0x0000000000000000000000000000000000000000",
   "config": {
     "homesteadBlock": 0,
     "byzantiumBlock": 0,
     "chainId": 10,
     "eip150Block": 0,
     "eip155Block": 0,
     "eip150Hash": "0x0000000000000000000000000000000000000000000000000000000000000000",
     "eip158Block": 0,
     "isQuorum": true
    },
   "difficulty": "0x0",
   "extraData": "0x0000000000000000000000000000000000000000000000000000000000000000",
   "gasLimit": "0xE0000000",
   "mixhash": "0x00000000000000000000000000000000000000647572616c65787365646c6578",
   "nonce": "0x0",
   "parentHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
   "timestamp": "0x00"
  }
EOF
}

if [ -f genesis.json ]; then
  while true; do
    read -p "Genesis file already exists. Do you want to override? [y/n]" yn
    case $yn in
    [Yy]*)
      createGenesisFile
      exit 0
      ;;
    [Nn]*)
      exit
      ;;
    *)
      echo "Please answer yes or no."
      ;;
    esac
  done
else
  createGenesisFile
fi
