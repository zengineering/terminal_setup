_toggle_mouse() {
  old=$(tmux show -gv mouse)
  new=""

  if [ "$old" = "on" ]; then
    new="off"
  else
    new="on"
  fi

  tmux set -g mouse $new \;\
       display "mouse: $new"
}

_circled_digit() {
  circled_digits='⓪ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩ ⑪ ⑫ ⑬ ⑭ ⑮ ⑯ ⑰ ⑱ ⑲ ⑳'
  if [ "$1" -le 20 ] 2>/dev/null; then
    i=$(( $1 + 1 ))
    eval set -- "$circled_digits"
    eval echo "\${$i}"
  else
    echo "$1"
  fi
}

_root() {
  tty=${1:-$(tmux display -p '#{pane_tty}')}
  username=$(_username "$tty" false)

  if [ x"$username" = x"root" ]; then
    tmux show -gqv '@root'
  else
    echo ""
  fi
}

"$@"
