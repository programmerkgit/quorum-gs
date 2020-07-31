#!/bin/bash
geth attach quorum/fromscratch/node1/geth.ipc
# raft.addPeer('enode://a810ddacd38f343aeee8eaf12c7a8307d1e00395e6cbc10c88d469b580cd29b55a2290ab9677ffb7e73f44e4a7059341f657c7e989c97e754db84d96464d3890@127.0.0.1:21001?discport=0&raftport=50001')
# raft.removePeer(2)
popd
