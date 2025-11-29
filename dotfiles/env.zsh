GLANCES_PKGNAME=glances

if [ -r /etc/redhat-release ]
then
  OS=redhat
  function install_tool() {
    brew install -q $1
  }
elif [ -r /etc/debian_version ]
then
  OS=debian
  function install_tool() {
    apt-cache show $1 >/dev/null 2>&1
    if [ $? -ne 100 ]; then
      sudo /usr/bin/apt-get -yqq install $1
    else
      brew install -q $1
    fi
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

[ -f ~/.dotfiles/${OS}/env.zsh ] && . ~/.dotfiles/${OS}/env.zsh
