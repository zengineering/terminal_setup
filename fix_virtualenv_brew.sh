#!/usr/bin/env sh

# https://stackoverflow.com/questions/23233252/broken-references-in-virtualenvs

if [ "$#" -ne 2 ]; then
    echo "Usage: ./fix_virtualenv_brew.sh <virtualenv name> <python version>"
else 
    gfind $HOME/.virtualenv/$1/ -type l -xtype 1 -delete
    virtualenv $HOME/.virtualenv/$1/ -p $2
fi
