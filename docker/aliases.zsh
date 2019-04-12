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

  dcu() {
    _DC_PROJECT=$(basename $PWD | awk -F- '{ print $NF}')
    docker-compose pull
    docker-compose -p ${_DC_PROJECT} up -d
    unset _DC_PROJECT
  }

  dcs() {
    _DC_PROJECT=$(basename $PWD | awk -F- '{ print $NF}')
    docker-compose -p ${_DC_PROJECT} stop
    unset _DC_PROJECT
  }

  alias docker-system-prune='docker system prune -a --volumes -f'
  alias dim='docker images'
}
