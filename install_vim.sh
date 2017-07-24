if [ $(basename $PWD) != terminal_setup ]; then
    echo "Run from terminal_setup dir."
    exit 1
fi

TSDIR=$PWD
PREFIX=$HOME/.local

cd vim
./configure --enable-fail-if-missing- -prefix=$PREFIX --with-features=huge --enable-multibyte --enable-python3interp --enable-luainterp --enable-gui=no --with-lua-prefix=$PREFIX/lua_install 
make -j8
make install
