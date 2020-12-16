#!/bin/bash
cd ../
export PATH=$(pwd)/quorum/build/bin:$PATH
cd quorum/fromscratch

echo "chose node to attach"
select nodedir in */; do
  echo $nodedir
  geth attach "$nodedir/geth.ipc"
  break
done
