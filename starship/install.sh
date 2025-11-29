# install vim bundle structure

if [ -f ~/.config/starship.toml ]; then
  rm -f ~/.config/starship.toml
fi

ln -sf ~/.dotfiles/starship/starship.toml ~/.config/starship.toml
