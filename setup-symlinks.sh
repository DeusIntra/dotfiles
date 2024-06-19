#!/usr/bin/bash

home_files=(".bashrc" ".gitconfig")
home_dirs=(".themes" ".icons")
dot_config_dirs=("nvim")

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

for file in ${home_files[@]}; do
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
  ln -s $SCRIPT_DIR/.config/$directory $dir_name
  echo created soft link for $dir_name
done


for directory in ${home_dirs[@]}; do
  dir_name=$HOME/$directory
  if [ -d $dir_name ]; then
    rm $dir_name
    echo removed $dir_name
  fi
  ln -s $SCRIPT_DIR/$directory $dir_name
  echo created soft link for $dir_name
done

# exclude_list=("setup-symlinks.sh" ".git" ".gitignore")
# 
# home_files=$(ls -A)
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
