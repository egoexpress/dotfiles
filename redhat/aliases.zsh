[ -r /etc/redhat-release ] && {
  unset RPROMPT
  update() {
    local PROGS=`toast status | grep -v "^ .*"`
    eval "TOASTPROGS=($PROGS)"
    for TOASTPROG in $TOASTPROGS; do
      /usr/bin/toast upgrade $TOASTPROG
    done
    unset TOASTPROGS
  }
}
