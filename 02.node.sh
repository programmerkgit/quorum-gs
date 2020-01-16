#!/bin/bash
mkdir -p quorum/fromscratch/node1
pushd quorum/fromscratch
geth --datadir node1 account new
address=$(cat node1/keystore/UTC* | jq .address | sed -e 's/^"//' -e 's/"$//')
touch genesis.json
cat <<EOF > genesis.json
{
  "alloc": {
    "0x${address}": {
      "balance": "1000000000000000000000000000"
    },
   "0xc5c7b431e1629fb992eb18a79559f667228cd055": {
      "balance": "2000000000000000000000000000"
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
popd
