VERSION=3.6.5
wget https://www.python.org/ftp/python/$VERSION/Python-$VERSION.tgz
tar xf Python-$VERSION.tgz
cd Python-$VERSION
./configure --prefix=$HOME/.local --with-ensurepip=install --enable-optimizations
make -j4
make altinstall
