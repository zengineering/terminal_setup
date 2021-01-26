#!/usr/bin/env bash

MINOR_VERSION=3.7.0
MAJOR_VERSION=${MINOR_VERSION%.*}
echo $MAJOR_VERSION
wget https://www.python.org/ftp/python/$MINOR_VERSION/Python-$MINOR_VERSION.tgz
tar xf Python-$MINOR_VERSION.tgz
cd Python-$MINOR_VERSION
./configure --prefix=$HOME/.local --with-ensurepip=install --enable-optimizations
make -j4
make altinstall
ln -s $HOME/.local/bin/python$MAJOR_VERSION $HOME/.local/bin/python3
ln -s $HOME/.local/bin/pip$MAJOR_VERSION $HOME/.local/bin/pip3
