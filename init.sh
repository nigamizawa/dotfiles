#!/bin/zsh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

add submodule
git submodule update --init --recursive

# prezto
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

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

source ~/dotfiles/.zshrc
source ~/dotfiles/.zpreztorc
