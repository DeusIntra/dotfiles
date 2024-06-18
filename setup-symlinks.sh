#!/usr/bin/bash

files=(".bashrc" ".gitconfig")
dot_config_dirs=("nvim")

for file in ${files[@]}; do
  echo $file
  if [ -f $HOME/$file ] || [ -L $HOME/$file ]; then
    rm $HOME/$file
    echo removed $HOME/$file
  fi
  ln $file $HOME/$file
  echo created hard link for $HOME/$file
done

for directory in ${dot_config_dirs[@]}; do
  dir_name=$HOME/.config/$directory
  if [ -d $dir_name ]; then
    rm $dir_name
    echo removed $dir_name
  fi
  ln -s $(pwd)/.config/$directory $dir_name
  echo created soft link for $dir_name
done

# exclude_list=("setup-symlinks.sh" ".git" ".gitignore")
# 
# files=$(ls -A)
# 
# is_excluded() {
#   local item=$1
#   for exclude in "${exclude_list[@]}"; do
#     if [ $item == $exclude ]; then
#       return 0 # True
#     fi
#   done
#   return 1 # False
# }
