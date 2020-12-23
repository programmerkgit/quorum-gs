#!/bin/bash

readonly filename=".db/processes"

if [ -f "$filename" ]; then
  :
else
  mkdir -p ".db"
  touch "$filename"
fi

function removeNotExistProcessesFromFile() {
  # 各行についてプロセスの存在の確認を行う
  psax="$(ps ax -o command,pid)"
  pses=$(while read line; do
    if [ "$line" != "" ]; then
      set $line
      pid=$1

      # プロセスが存在する場合のみラインを記述
      echo "$psax" | grep geth | grep "$pid" >/dev/null 2>&1
      if [ $? -eq 0 ]; then
        echo "$line"
      fi
    fi
  done <"$filename")

  # ファイルの上書き
  echo "$pses" >"$filename"
}

function printProcesses() {
  echo "PID NodeNumber port rpcport raftport"e
  cat "$filename"
}

removeNotExistProcessesFromFile
printProcesses
