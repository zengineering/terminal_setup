#!/usr/bin/env sh

if [ $(basename $PWD) != terminal_setup || $(basename $PWD) != .terminal_setup ]; then
    echo "Run from terminal_setup dir."
    exit 1
fi

cd bundle
for p in *; do
    echo $p
    cd $p
    git checkout master
    git pull
    cd -
done
git commit -m "update all vim plugins" .
    
