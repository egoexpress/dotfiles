[ -r /usr/bin/docker ] && {
  
  # only alias on MacOSX (use group 'docker' on Linux)
  if [ `uname` = "Darwin" ]; then
    DOCKER_BINARY="sudo /usr/bin/docker"
  else
    DOCKER_BINARY="/usr/bin/docker"
  fi

  # wrapper for 'docker exec -it <container> /bin/bash'
  db() {
    ${DOCKER_BINARY} exec -it "${1}" /bin/bash
  }

  # helper function
  # check if a docker-compose setup exists in the current directory
  _check_for_docker_compose_file() {
    ([ -r ${PWD}/docker-compose.yml ] || [ -r ${PWD}/docker-compose.yaml ]) || {
      echo 'No docker-compose configuration found in current directory, exiting.'
      return 1
    }
    return 0
  }

  # wrapper for 'docker-compose up'
  # get project name from current directory
  # pull images before run (useful for update scenarios)
  # check if a docker-compose.local.yml exists, prefer it over
  #   a docker-compose.override.yml file
  # run startup.sh before docker-compose run if present
  dcu() {
    _check_for_docker_compose_file || return 1

    [ -d .git ] && git pull -q

    _DC_FILES=""
    _DC_PROJECT=$(basename $PWD | awk -F- '{ print $NF}')
    ${DOCKER_BINARY} compose pull --ignore-pull-failures --quiet
    [ -r ${PWD}/docker-compose.local.yml ] && {
      _DC_FILES="-f docker-compose.local.yml -f docker-compose.yml"
    }
    [ -r ${PWD}/startup.sh ] && {
      . ${PWD}/startup.sh
    }
    ${DOCKER_BINARY} compose ${_DC_FILES} -p ${_DC_PROJECT} up -d
    unset _DC_PROJECT _DC_FILES
  }

  # wrapper for 'docker-compose stop'
  # get project name from current directory
  dcs() {
    _check_for_docker_compose_file || return 1

    _DC_PROJECT=$(basename $PWD | awk -F- '{ print $NF}')
    ${DOCKER_BINARY} compose -p ${_DC_PROJECT} stop
    unset _DC_PROJECT
  }

  # wrapper for 'docker-compose logs'
  # get project name from current directory
  dcpl() {
    _check_for_docker_compose_file || return 1

    _DC_PROJECT=$(basename $PWD | awk -F- '{ print $NF}')
    ${DOCKER_BINARY} compose -p ${_DC_PROJECT} logs $*
    unset _DC_PROJECT
  }

  # wrapper for 'docker-compose run'
  # get services from docker-compose file and run them
  dcsr() {
    _check_for_docker_compose_file || return 1

    _SERVICE_NAME=$(docker-compose config --services)
    ${DOCKER_BINARY} compose run --rm ${_SERVICE_NAME} $*

    unset _SERVICE_NAME
  }

  docker-compose-backup() {
    _DC_PROJECT="$1"
    [ -z "$1" ] && {
      _check_for_docker_compose_file || return 1
      dcs
      _DC_PROJECT=$(basename $PWD | awk -F- '{ print $NF}')
    }

    for volume in $(${DOCKER_BINARY} volume ls -qf name=${_DC_PROJECT}_); do
      echo -n "Backing up volume ${volume}..."
      ${DOCKER_BINARY} run -v ${volume}:/volume -v /tmp:/backup --rm loomchild/volume-backup backup ${volume}
      echo 'done.'
    done

    tar --strip-components=1 -czf ${_DC_PROJECT}.tar.gz /tmp/${_DC_PROJECT}*

    [ -z $1 ] && dcu

    unset _DC_PROJECT
  }

  docker-compose-restore() {
    _FILENAME="$1"
    ([ -z "${_FILENAME}" ] || [ ! -r "${_FILENAME}" ]) && {
      echo "Please provide a tar.gz file containing the volume backup as an argument."
      return 1
    }

    _UNPACKDIR=/tmp/$(basename ${_FILENAME}).$$
    _FILENAME=$(realpath ${_FILENAME})

    mkdir ${_UNPACKDIR}
    cd ${_UNPACKDIR}
    tar --strip-components=1 -xzf ${_FILENAME}
    for FILE in $(ls --color=never *.tar.bz2); do
      _VOLUME_NAME=$(echo $FILE | sed "s/.tar.bz2//")
      echo -n "Restoring volume ${_VOLUME_NAME}..."
      ${DOCKER_BINARY} run -v ${_VOLUME_NAME}:/volume -v ${_UNPACKDIR}:/backup --rm loomchild/volume-backup restore ${_VOLUME_NAME}
      echo 'done.'
    done
    cd - >/dev/null
    rm -rf ${_UNPACKDIR}
  }

  alias docker-system-prune='${DOCKER_BINARY} system prune -a --volumes -f'
  alias dim='grc ${DOCKER_BINARY} images'

  # get container name(s) a volume is bound to
  # https://stackoverflow.com/questions/42857575/how-to-determine-what-containers-use-the-docker-volume
  docker-container-vol() {
    grc ${DOCKER_BINARY} ps -a --format "{{.Names}}" --filter volume=${1}
  }

  docker-upgrade-db() {
    [ -r docker-compose.override.yml ] && {
      MYSQL_ROOT_PASSWORD=$(grep -E -i 'MARIADB_ROOT_PASSWORD|MYSQL_ROOT_PASSWORD' docker-compose.override.yml | awk -F"=" '{print $2}')
      DC_PROJECT=$(basename $PWD | awk -F- '{ print $NF}')
      ${DOCKER_BINARY} exec -it ${DC_PROJECT}-db-1 mariadb-upgrade -u root -h localhost --password=${MYSQL_ROOT_PASSWORD} ${DC_PROJECT}
    }
  }
}

alias dps='docker ps' 
alias dpa='docker ps -a'
