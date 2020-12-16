#!/bin/bash
cd ../
export PATH=$(pwd)/quorum/build/bin:$PATH
mkdir -p quorum/fromscratch
cd quorum/fromscratch
## listen to user, which node to create account
echo "Which node to add account"
select nodedir in */; do
  echo $nodedir
  geth --datadir $nodedir account new
  break
done
