grep "Arch Linux" /etc/os-release >/dev/null 2>&1 && {
  alias pacman='sudo pacman'
  alias btrfs='sudo btrfs'
  alias update='cd; git pull; pacman -Syu --noconfirm; pacman -Sc --noconfirm; update-submodules; resource-zshfiles; cd - >/dev/null'
  alias systemctl='sudo systemctl'
}
