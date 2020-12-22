#!/bin/bash

readonly filename=".db/processes"
function removeNotExistProcessesFromFile() {
  # 各行についてプロセスの存在の確認を行う
  psax="$(ps ax -o command,pid)"
  processes=$(while read line; do
    # PIDを設定
    set $line
    pid=$1

    # プロセスが存在する場合のみラインを記述
    echo "$psax" | grep geth | grep "$pid" >/dev/null 2>&1
    if [ $? -eq 0 ]; then
      echo "$line"
    fi

  done <"$filename")

  # ファイルの上書き
  echo "$processes" >"$filename"
}

function printProcesses() {
  echo "PID NodeNumber port rpcport raftport"
  cat "$filename"
}

removeNotExistProcessesFromFile
printProcesses
