#!/bin/bash
export PATH=$(pwd)/quorum/build/bin:$PATH
geth attach quorum/fromscratch/node1/geth.ipc
