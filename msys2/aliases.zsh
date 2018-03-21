# settings for MSys2 (Windows shell implementation)

[ `uname` = "MSYS_NT-6.1" ] && {
  alias vi=vim
  
  update() {
    cd
    git pull
    update-core
    pacman -Syu
    update-submodules
    resource-zshfiles
    cd - >/dev/null
  }
}
