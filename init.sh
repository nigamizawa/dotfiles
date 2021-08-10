#!/bin/zsh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# add submodule
git submodule update --init --recursive

# add config folders
folders=(
  zsh
  # nvim
)

for folder in $folders; do
  for rcfile in $SCRIPT_DIR/$folder/*(.N); do
    # echo $rcfile
    # echo ${rcfile:t}
    ln -sf "$rcfile" ${ZDOTDIR:-$HOME}/.${rcfile:t}
  done
done

source ${ZDOTDIR:-$HOME}/.zshrc
source ${ZDOTDIR:-$HOME}/.zpreztorc
