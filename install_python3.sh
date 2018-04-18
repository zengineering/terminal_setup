VERSION=3.6.5
wget https://www.python.org/ftp/python/$VERSION/Python-$VERSION.tgz
tar xf Python-$VERSION.tgz
cd Python-$VERSION
./configure --prefix=$HOME/.local --with-ensurepip=install --enable-optimizations
make -j4
make altinstall
ln -s $HOME/.local/bin/python3.6 $HOME/.local/bin/python3
ln -s $HOME/.local/bin/pip3.6 $HOME/.local/bin/pip3
