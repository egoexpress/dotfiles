if [ -r /etc/redhat-release ]
then
  OS=redhat
  function install_tool() {
    brew install $1
  }
elif [ -r /etc/debian_version ]
then
  OS=debian
  function install_tool() {
    sudo /usr/bin/apt-get -yqq install $1
  }
elif [ -x /bin/freebsd-version ]
then
  OS=freebsd
  function install_tool() {
    sudo pkg install $1
  }
else
  OS=unknown
  function install_tool() {
    echo "No method defined to install $1"
  }
fi
