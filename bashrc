#!/usr/bin/env bash

if [ -f /etc/bashrc ]; then
    source /etc/bashrc  
fi
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

for bash_lib in $(ls ${HOME}/.bash.d/*.sh) ; do
  source $bash_lib
done

welcome