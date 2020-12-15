#!/bin/bash
cd ../
export PATH=$(pwd)/quorum/build/bin:$PATH
mkdir -p quorum/fromscratch/node1
cd quorum/fromscratch
## listen to user, which node to create account
## TODO: increment directory name. ex) node1, node2
geth --datadir node1 account new
address=$(cat node1/keystore/UTC* | jq .address | sed -e 's/^"//' -e 's/"$//')

# create genesis.json
## TODO: allocate balance

touch genesis.json
cat <<EOF > genesis.json
{
  "alloc": {
    "0x${address}": {
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
echo "Change genesis.json file to add alloc key address."
