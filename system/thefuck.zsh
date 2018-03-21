[ -r /usr/bin/thefuck ] && {
  alias fuck && unalias fuck
  eval $(thefuck --alias)
}
