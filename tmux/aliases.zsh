tma() {
  local SESSION_NAME=`tmux ls | awk -F: '{print $1}' 2>/dev/null`
  [ -n "${SESSION_NAME}" ] && tmux -2u attach -t ${SESSION_NAME}
}

# automatically attach to 'servers' session
tmux list-sessions 2>/dev/null | grep "servers.*\]$" >/dev/null 2>&1 && {
  tmux -2u attach -t servers
}

[ -x /usr/local/bin/tmuxinator ] && {
  alias tmuxinator='export TERM=screen-256color; tmuxinator'
}
