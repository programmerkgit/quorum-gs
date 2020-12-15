# Environment
- MacOS
# Prerequisite
- jq
- go

# Quorum起動手順
以下のコマンドを順番に実行することでQuorumを起動することができます。

0. `brew install jq`
1. `. 00.export-path.sh`
2. `./01.install-quorum.sh`
3. `./02.create-node.sh` 
4. `./03.set-nodekey-and-static-nodes.sh`
4. `./04.init-node.sh`
5. `./05.run.sh`
6. `./06.attach.sh`

# kill process
from activity monitor, kill geth
raft.removePeer(id)
raft.cluster
