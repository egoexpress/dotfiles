# install vim bundle structure

if [ ! -d ~/.vim-bundle ]; then
  mkdir ~/.vim-bundle
  ln -s ~/.vim-bundle ~/.vim/bundle
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
fi
