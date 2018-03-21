[ -r /usr/bin/docker ] && {
  # only alias on MacOSX (use group 'docker' on Linux)
  [ `uname` = "Darwin" ] && alias docker="sudo docker"
}

[ -r /usr/bin/docker ] && {
  dps () {
    _FILTER="$1"
    [ $# -gt 1 ] && shift
    [ "${_FILTER}" != "" ] && _FORMAT="--filter=${_FILTER}"
    docker ps --format "table {{.ID}}	{{.Names}}	{{.Image}}	{{.Status}}	{{.RunningFor}}" ${_FORMAT} $*
    unset _FILTER _FORMAT
  }

  dpa() {
    dps "$1" -a
  }

  db() {
    docker exec -it "${1}" /bin/bash
  }

  alias dcu='docker-compose up -d'
}
