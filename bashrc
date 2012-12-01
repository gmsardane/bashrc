#!/usr/bin/env bash

if [ -f /etc/bashrc ]; then
    source /etc/bashrc  
fi

for bash_lib in $(ls ${HOME}/.bash.d/*.sh) ; do
  source $bash_lib
done
unset bash_lib

welcome