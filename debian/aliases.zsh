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
    cd ~/.dotfiles
    git pull
    sudo apt-get -yqq update
    sudo apt-get -yqq dist-upgrade
    sudo apt-get -yqq clean
    sudo apt-get autoremove -yqq
    brew update
    cd - >/dev/null
  }
}
