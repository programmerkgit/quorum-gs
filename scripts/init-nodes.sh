#!/bin/bash

i=1
while [ -d "../quorum/fromscratch/node${i}" ]; do
  ./init-node.sh "node${i}"
  ((i = i + 1))
done
