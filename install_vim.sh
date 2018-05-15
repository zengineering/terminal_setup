if [ $(basename $PWD) != terminal_setup ]; then
    echo "Run from terminal_setup dir."
    exit 1
fi

TSDIR=$PWD
PREFIX=$HOME/.local

if [ -d "$PREFIX/lua" ]; then
    cd vim
    ./configure --enable-fail-if-missing- -prefix=$PREFIX --with-features=huge --enable-multibyte --enable-python3interp --enable-luainterp --enable-gui=no --with-lua-prefix=$PREFIX/lua
    make -j8
    make install
else
    echo "Missing local lua install"
fi
