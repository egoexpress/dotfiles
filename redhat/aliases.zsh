[ -r /etc/redhat-release ] && {
  unset RPROMPT
  update() {
    local PROGS=`toast status | grep -v "^ .*"`
    eval "TOASTPROGS=($PROGS)"
    for TOASTPROG in $TOASTPROGS; do
      /usr/bin/toast upgrade $TOASTPROG
    done
    unset TOASTPROGS

    which brew >/dev/null 2>&1 && {
      brew update && brew upgrade
    }

    cd - >/dev/null
  }

  # prefer toast (http://www.toastball.net/toast) path if available
  [ -d $HOME/.toast/armed/bin ] && export PATH=$HOME/.toast/armed/bin:$PATH

  [ -d $HOME/.local/bin ] && export PATH=$HOME/.local/bin:$PATH
}
