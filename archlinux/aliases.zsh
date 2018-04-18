grep "Arch Linux" /etc/os-release >/dev/null 2>&1 && {
  alias pacman='sudo pacman'
  alias btrfs='sudo btrfs'
  alias update='cd; git pull -q; pacman -Syu --noconfirm; pacman -Sc --noconfirm; cd - >/dev/null'
  alias systemctl='sudo systemctl'
}
