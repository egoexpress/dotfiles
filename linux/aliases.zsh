[ `uname` = "Linux" ] && {

  which durep >/dev/null 2>&1 && {
    alias dur='durep -td 1'
  }

  alias tcptrace='tcptraceroute -q1 --track-port --dnat'

  # show listening ports
  alias sl="netstat -tulpn"

  alias rename-images="exiv2 -r '%Y-%m-%d_%H-%M-%S´ -F rename"

  drop-caches() {
    # stop raging kswapd
    sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"
  }
}
