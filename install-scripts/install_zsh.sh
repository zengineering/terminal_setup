#!/usr/bin/env bash

function install_zsh() {
    cd zsh
    ./configure --prefix=$PREFIX
    make -j8
    make install
    make install.info
}

# run in zsh
function setup_prezto() {
    etopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
}



if [ $(basename $PWD) != terminal_setup ]; then
    echo "Run from terminal_setup dir."
    exit 1
fi

PREFIX=$HOME/.local
install_zsh
ln -s $PWD/prezto $HOME/.prezto
