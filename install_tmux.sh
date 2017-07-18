if [ $PWD != terminal_setup ]; then
    echo "Run from terminal_setup dir."
    exit 1
fi

TSDIR=$PWD
PREFIX=$HOME/.local

#
# build/install libevent
#
function install_libevent() {
    cd $TSDIR/libevent
    ./autogen.sh
    ./configure --prefix=$PREFIX
    make -j8
    make install
}

#
# build/install ncurses
#
function install_ncurses() {
    cd $TSDIR
    mkdir ncurses
    cd ncurses
    URL=ftp://ftp.gnu.org/gnu/ncurses/ncurses-6.0.tar.gz
    tar xf $(basename $URL)
    cd $(basename $URL)
    CPPFLAGS="-P" ./configure --prefix=$PREFIX
    CPPFLAGS="-P" make -j8
    make install
}

# 
# build/install tmux
#
function install_tmux() {
    install_libevent
    install_ncurses
    cd $TSDIR/tmux
    ./autogen.sh
    ./configure --prefix=$PREFIX CPPFLAGS="-I$PREFIX/include" LDFLAGS="-L$PREFIX/lib"
    make -j8
    make install
}

function install_vim() {
    cd $TSDIR/vim
    ./configure --prefix=$PREFIX --enable-gui=no CPPFLAGS="-I$PREFIX/include" LDFLAGS="-L$PREFIX/lib"
    make -j8
    make install
}

