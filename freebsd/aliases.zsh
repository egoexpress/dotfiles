[ -x /usr/bin/uname ] && {
  [ `/usr/bin/uname` = "FreeBSD" ] && {
    update() {
      sudo rm -rf /var/db/freebsd-update/files

      local ISJAIL=`ls -id / | awk '{print $1}'`
      if [ $ISJAIL != 4 ]; then
        # main system
        sudo freebsd-update fetch && sudo freebsd-update install
        sudo portsnap fetch update

        # upgrade ports tree for jails
        [ -r  /usr/local/bin/ezjail-admin ] && sudo ezjail-admin update -P
      fi

      # run in jail and on base system
      # see http://www.tobeannounced.org/2014/08/keeping-freebsd-up-to-date/
      # sudo portmaster -ad --packages --no-confirm
      # sudo portmaster --check-depends
      # sudo portmaster --check-port-dbdir -y
      # sudo portmaster -sy --clean-distfiles
      sudo pkg update
      sudo pkg upgrade -y

      # don't use package management for now
      # if [ $ISJAIL != 4 ]; then
      #  sudo pkg update && sudo pkg upgrade && sudo pkg clean
      # fi

      sudo rm -rf /var/db/freebsd-update/files
    }

    alias vi=vim

    # reload pf configuration
    alias pfr="sudo pfctl -F all -f /etc/pf.conf"
    alias pfs="sudo pfctl -sn"
    alias top="top -CSjz -o cpu"

    # show listening sockets
    alias sl="sockstat -46l"

    [ -d /usr/jails ] && {
      update-jails() {
        # https://www.freebsd.org/doc/handbook/jails-ezjail.html

        JAILCOUNT=`jls | wc -l`
        if [ $JAILCOUNT -gt 1 ]; then
          echo "Jails are running, stop them first!"
          return
        fi
        # update basejail (with binaries)
        sudo ezjail-admin update -u
       
        # update configuration files
        for JAIL in `ls /usr/jails/*.link`; do
          sudo mergemaster -a -D ${JAIL}
        done

        # update ports
        sudo ezjail-admin update -P
      }
    }

    [ -d $HOME/downloads ] && {
      lftp() {
        cd $HOME/downloads
        /usr/local/bin/lftp $*
        cd - >/dev/null
      }
    }
  }

  dircolors() {}
}
