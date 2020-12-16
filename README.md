# Quorumスターター

Quorumをローカル環境でRaftクラスターを簡易的に動作させるためのプロジェクトです。

## 動作OS

MacOS

## 依存ライブラリのインストール

```
brew install jq
```

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

以下のコマンドを順番に実行することでQuorumを起動することができます。

### 2.Nodeの作成

以下のコマンドで好きな数のNodeを作成します。一度実行する度にNode1, Node2, Node3...とNodeが作成されていきます。

```
./add-node.sh
```

### 3.アカウントの作成
各Nodeで利用するアカウントを作成します。

```
./create-account.sh
```

### 4. Nodeの設定
ノードの作成・アカウントを作成したらネットワーク設定・各ノードの設定をおこないます。
この手順以降に追加でのノードの追加・アカウントの追加は現在サポートしていません。

```
./set-nodes.sh
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
全てのデータを削除して初期化します。初期化したら全てのブロックチェーンのデータとNodeの設定が削除されます。
この場合手順 '2. Nodeの作成' から全てやり直してください。

```
./clean-node.sh
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

