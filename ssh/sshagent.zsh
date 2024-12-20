keychain --version &>/dev/null

_load_kckey() {
  KEY="$1"
  eval `keychain -q --eval ${KEY}`
}

[ "$TERM" != "dumb" ] && {
  [ $? -eq 0 ] && {
    [ -r $HOME/.ssh/id_rsa ] && _load_kckey "$HOME/.ssh/id_rsa"
    [ -r $HOME/.ssh/id_ed25519 ] && _load_kckey "$HOME/.ssh/id_ed25519"
    [ -r $HOME/.ssh/id_ecdsa ] && _load_kckey "$HOME/.ssh/id_ecdsa"
  } || {
    [ "x${SSH_AGENT_PID}" = "x" ] && {
      eval `ssh-agent`
      [ -r $HOME/.ssh/id_rsa ] && ssh-add $HOME/.ssh/id_rsa
      [ -r $HOME/.ssh/id_rsa.github ] && ssh-add $HOME/.ssh/id_rsa.github
      [ -r $HOME/.ssh/id_ed25519 ] && ssh-add $HOME/.ssh/id_ed25519
      [ -r $HOME/.ssh/id_ecdsa ] && ssh-add $HOME/.ssh/id_ecdsa
    }
  }
}
