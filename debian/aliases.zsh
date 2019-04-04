[ -r /etc/debian_version ] && {
  alias apt-get='sudo apt-get'

  alias acs='apt-cache search'
  alias acsh='apt-cache show'
  alias acp='apt-cache policy'
  alias adg="apt-get dist-upgrade"
  alias agi="apt-get install"
  alias ag="apt-get upgrade"
  alias au="apt-get update"
  alias dbp='dpkg-buildpackage'

  update() {
    sudo /usr/bin/apt-get -yqq update
    sudo /usr/bin/apt-get -yqq dist-upgrade
    sudo /usr/bin/apt-get -yqq clean
    sudo /usr/bin/apt-get autoremove -yqq
  }

  # add GPG key for apt repositories
  alias add-apt-key='sudo /usr/bin/apt-key adv --keyserver keyserver.ubuntu.com --recv-keys'

  remove-kernel() {
    _KERNEL_VERSION="$1"

    [ -z ${_KERNEL_VERSION} ] && {
      echo "Specify a kernel version to remove"
      return 1
    }

    _PACKAGES=`dpkg -l | grep "linux.*-${_KERNEL_VERSION}.*"`
    if [ ! -z "${_PACKAGES}" ]; then
      dpkg -l | grep "ii.*linux.*-${_KERNEL_VERSION}.*" | awk '{ print $2 }' | xargs sudo apt-get remove
      dpkg -l | awk '{ print $2 }' | grep "linux.*-${_KERNEL_VERSION}.*" | xargs sudo dpkg -P
    fi

    unset _KERNEL_VERSION _PACKAGES
  }
}
