#!/bin/bash

readonly filename=".db/processes"
readonly temp_file=$(mktemp)
function removeNotExistProcessesFromFile() {
  # 各行についてプロセスの存在の確認を行う
  while read line; do
    # PIDを設定
    set $line
    pid=$1

    # プロセスが存在する場合のみラインを記述
    ps aux -o command,pid | grep geth | grep "$pid" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
      echo "$line" >>"$temp_file"
    fi

  done <"$filename"

  # ファイルの上書き
  cat "$temp_file" >"$filename"
  rm "$temp_file"
}

function printProcesses() {
  echo "PID NodeNumber port rpcport raftport"
  cat "$filename"
}

removeNotExistProcessesFromFile
printProcesses
