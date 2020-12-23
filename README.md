# quorum-gs

quorum-gs helps you to build quorum raft cluster in a minute for development purpose.

<a href="https://asciinema.org/a/MB2g4ALTTU4QnAKz6CEHWV3va" target="_blank"><img src="https://asciinema.org/a/MB2g4ALTTU4QnAKz6CEHWV3va.svg" /></a>

## Environment
MacOS

## processes

1. Install quorum
2. Create nodes.
3. Create accounts.
4. Initialize network setting.
5. Run node.
6. Attach to node.

### 1. Install quorum
This command install quorum and build. 

```
./install-quorum.sh
```

### 2. Create nodes
Run the script. You can create any number of nodes.

```
./creaet-node.sh
```

### 3.Create accounts
Create an account on a node. You should keep one public address to allocate initial balance on the next step. 

```
./create-account.sh
```

### 4. Initialize network
You allocate initial balance to an account and create network setting files.

```
./4.init-network.sh
```

### 5. Run node
Chose one node to run from the nodes you created.

```
./run-node.sh
```

### 5. Attach to node.
You choose a node to attach.

```
./attach-node.sh
```

## Other

### Delete all nodes
Delete all nodes and data and network settings. 

```
./clean-node.sh
```

### List running node processes

```
./processes.sh
```

### Kill node

```
./processes.sh # list all running nodes
./kill-node.sh "$pid"
```

## TODO

### Commands to implement

- quorum run --port=21000
- quorum ps
- quorum stop id
- quorum build ?

### Multiple instance

- quorum-compose up

0x2d692338a367A12F33F7aD788868dcb5aF81c5B1

### How to get PID

foo & FOO_PID=$!
https://stackoverflow.com/questions/1908610/how-to-get-process-id-of-background-process


---

# Quorum スターター[Japanese]

QuorumのRaftクラスターをローカル環境で簡易的に動作させるためのプロジェクトです。 開発・検証用途に利用してください。

## 動作確認OS

MacOS

## Quorum起動手順

以下の手順でセットアップします。

1. Quorumのインストール
2. Nodeの作成
3. アカウントの作成
4. Nodeの設定
5. Nodeの起動
6. Nodeへ接続

### 1. Quorumのインストール

以下のコマンドでQuorumをインストール・ビルドします。

```
./install-quorum.sh
```

### 2.Nodeの作成

以下のコマンドで好きな数のNodeを作成します。一度実行する度にNode1, Node2, Node3...とNodeが作成されていきます。

```
./creaet-node.sh
```

### 3.アカウントの作成

各Nodeで利用するアカウントを作成します。 この時に生成されたアドレスのうちのどれか一つは後の手順で利用するためメモしておきましょう。

```
./create-account.sh
```

### 4. Nodeの設定

ネットワークの定義ファイルを作成します。 この時、3の手順でメモした初期残高を割り当てるアカウントのアドレスを入力します。

```
./4.init-network.sh
```

### 5. Nodeの起動

作成したNodeのうち任意のNodeを起動します。

```
./run-node.sh
```

### 6. Nodeへの接続

起動したNodeのコンソールへ接続します。

```
./attach-node.sh
```

## その他

### Nodeを全て削除

全てのノードを削除して初期化します。アカウントやブロックチェーンのデータも全て消えるので注意してください。 削除後は手順 '2. Nodeの作成' の手順からやり直してください。

```
./clean-node.sh
```

### 起動しているNodeの一覧の表示

```
./processes.sh
```

### Nodeの停止

以下の手順でプロセスIDを特定し、killします。

```
./processes.sh # 起動しているノードのプロセスIDを取得する。
./kill-node.sh "$pid" # ノードを停止させる。
```

## TODO

### Commands to implement

- quorum run --port=21000
- quorum ps
- quorum stop id
- quorum build ?

### Multiple instance

- quorum-compose up

0x2d692338a367A12F33F7aD788868dcb5aF81c5B1

### How to get PID

foo & FOO_PID=$!
https://stackoverflow.com/questions/1908610/how-to-get-process-id-of-background-process
