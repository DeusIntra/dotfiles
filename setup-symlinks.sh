#!/usr/bin/bash

dotfiles=(
  ".bashrc"
  ".gitconfig"
  ".config/nvim"
  ".config/xfce4"
  ".config/Thunar"
  ".ssh/config"
  ".themes"
  ".icons"
  ".local/share/applications/nvim-terminal.desktop"
  ".fonts"
)

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

for dotfile in ${dotfiles[@]}; do
  dir_name=$(dirname $dotfile)
  if [ ! -d $HOME/$dir_name ]; then
    mkdir -p $HOME/$dir_name
    echo created NEW directory $dir_name
  fi
  if [ -L $HOME/$dotfile ]; then
    rm $HOME/$dotfile
  elif [ -e $HOME/$dotfile ]; then
    path_name=$(dirname "${dotfile}")
    if [ $path_name = "." ]; then
      mv --backup --suffix=.bak $HOME/$dotfile $HOME/$dotfile
    else
      mv --backup --suffix=.bak $HOME/dotfile $HOME/$path_name
    fi
    echo created backup for $HOME/$dotfile
  fi

  ln -s $SCRIPT_DIR/$dotfile $HOME/$dotfile
  echo created symlink for $HOME/$dotfile
done

