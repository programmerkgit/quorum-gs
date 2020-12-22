# Quorum スターター

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
./1.install-quorum.sh
```

### 2.Nodeの作成

以下のコマンドで好きな数のNodeを作成します。一度実行する度にNode1, Node2, Node3...とNodeが作成されていきます。

```
./2.creaet-node.sh
```

### 3.アカウントの作成

各Nodeで利用するアカウントを作成します。 この時に生成されたアドレスのうちのどれか一つは後の手順で利用するためメモしておきましょう。

```
./3.create-account.sh
```

### 4. Nodeの設定

ノードの作成・アカウントを作成したらネットワーク設定・各ノードの設定をおこないます。 この時、3の手順でメモした初期残高を割り当てるアカウントのアドレスを入力します。

この手順以降に追加でのノードの追加・アカウントの追加は現在サポートしていません。

```
./4.set-up-nodes.sh
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
ps aux | grep geth
kill -9 $processid
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
