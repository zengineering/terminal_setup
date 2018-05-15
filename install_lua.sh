if [ $(basename $PWD) != terminal_setup ]; then
    echo "Run from terminal_setup dir."
    exit 1
fi

TSDIR=$PWD
PREFIX=$HOME/.local

mkdir -p $PREFIX/lua
cd lua
make linux install INSTALL_TOP=$PREFIX/lua
cd ..

