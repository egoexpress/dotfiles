# install vim bundle structure

if [ -d ~/.config/nvim ]; then
  rm -rf ~/.config/nvim
fi

ln -sf ~/.dotfiles/nvim ~/.config/nvim
