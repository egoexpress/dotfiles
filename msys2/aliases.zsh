# settings for MSys2 (Windows shell implementation)

[ `uname` = "MSYS_NT-6.1" ] && {
  alias vi=vim
  
  update() {
    update-core
    pacman -Syu
  }
}
