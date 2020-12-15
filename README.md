# Environment

- MacOS

# Prerequisite

- jq
- go

# Quorum起動手順

以下のコマンドを順番に実行することでQuorumを起動することができます。

0. `brew install jq`
1. `./install-quorum.sh`
2. `./setup-node.sh
3. `./run-node.sh`
4. `./attach-node.sh`

# kill process

from activity monitor, kill geth raft.removePeer(id)
raft.cluster

## TODO

### Commands to implement

- quorum run --port=21000
- quorum ps
- quorum stop id
- quorum build ?
### Multiple insatncesc

- quorum-compose up
### Performance
install-quorum.shを早くする
ディレクトリ構成を整理
