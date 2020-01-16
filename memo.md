# 目的
Quorumの作成手順を体験して理解できる

# go version管理
brew go version management
[gvm](https://github.com/moovweb/gvm)

https://docs.goquorum.com/en/latest/Getting%20Started/Creating-A-Network-From-Scratch/

# 分からないこと
Privacy Manager


```
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
```

```s
brew update
brew search go
// install
brew install go
brew info go
go env
// uninstall
brew switch go 1.5.4
brew uninstall go
brew switch go 1.8.3
```

# startnode1.sh
export PATH=$(pwd)/build/bin:$PATH

# attach to process

Console Of Geth JavaScript Console

```shell script
geth attach new-node-1/geth.ipc
```



# 

# Memo
Raft Vs Intanbule
Why Raft
AS Containers or Privacy Managers
What is quorum
