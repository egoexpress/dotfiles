which keychain &>/dev/null

_load_kckey() {
  KEY="$1"
  keychain --list | grep ${KEY} >&/dev/null || {
    eval `keychain -q --eval --agents ssh ${KEY}`
  }
}


if [ "$TERM" != "dumb" ]; then
  if  [ "x${SSH_AGENT_PID}" = "x" ]; then
    eval `ssh-agent`
    [ -r $HOME/.ssh/id_rsa ] && ssh-add $HOME/.ssh/id_rsa
    [ -r $HOME/.ssh/id_rsa.github ] && ssh-add $HOME/.ssh/id_rsa.github
    [ -r $HOME/.ssh/id_ed25519 ] && ssh-add $HOME/.ssh/id_ed25519
    [ -r $HOME/.ssh/id_ecdsa ] && ssh-add $HOME/.ssh/id_ecdsa
  else
    [ -r $HOME/.ssh/id_rsa ] && _load_kckey "id_rsa"
    [ -r $HOME/.ssh/id_ed25519 ] && _load_kckey "id_ed25519"
    [ -r $HOME/.ssh/id_ecdsa ] && _load_kckey "id_ecdsa"
  fi
fi

alias ssh-keygen-secure="ssh-keygen -o -a 100 -t ed25519"
