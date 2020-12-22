#/bin/sh
NOCOLOR="\e[m"
GREEN="\e[32m"
CURSOR="\e[1;31m>\e[m\n"
MOVECURSOR="\e[<配列の長さ>A"
CLOSE="\e[m"
function menu() {
  # メニューカーソルの位置
  choice=0
  # メニューを配列でずらっと
  menu=(
    "First Option"
    "Second Option"
    "Third Option"
  )
  tail=$(expr ${#menu[@]} - 1)                # メニューの末尾番号
  printf "${GREEN}Choose one${NOCOLOR}\n" >&2 # 緑色で "choose one"
  # 下のループの先頭でメニューの数だけ上ってくるので、
  # メニューの数だけ下改行しておく
  for _ in $(seq 0 $tail); do echo ""; done

  # 無限ループ
  while true; do
    # \e[<配列の長さ>A でメニューの数だけ上に移動
    printf "\e[${#menu[@]}A\e[m" >&2

    # メニューをそれぞれ出力する
    for i in $(seq 0 $tail); do
      if [ $choice = $i ]; then # メニューが選択中なら
        # \e[1;31 (bold);(red)で
        # '> '
        # をprint
        # 続く文字列を \e[1;4 (bold);(underlined)にする
        printf "\e[1;31m>\e[m \e[1;4m" >&2
      else # メニューが選択中でなければ
        # 空白をprint
        printf "  " >&2
      fi
      # メニューをprintし、graphic modeを閉じる
      printf "${menu[$i]}\e[m\n" >&2
    done

    # 一文字入力を読む
    read -sn1 answer
    # エスケープコードが打たれたら
    if [ "$answer" = "^[" ]; then # (^[はctrl+V ctrl+[とかで入力してね)
      # 残りのエスケープコードを読む
      read -sn2 answer
      # アローキーなら^[[A, B, C, Dってなるよ
    fi
    case $answer in
    "j" | "[B")
      # j, 下アローキーで下に移動（choice+1）
      # choiceの最大値はメニュー配列の末尾番号なので超えないように
      if [ $choice -lt $tail ]; then choice=$(expr $choice + 1); fi
      ;;
    "k" | "[A")
      # k, 上アローキーで上に移動（choice-1）
      # choiceの最小値は0なので超えないように
      if [ $choice -gt 0 ]; then choice=$(expr $choice - 1); fi
      ;;
    "")
      # 改行で決定
      echo ${menu[$choice]}
      return
      ;;
    esac
  done
}

menu
