if [ $PWD != terminal_setup ]; then
    echo "Run from terminal_setup dir."
    exit 1
fi

ln -s $PWD $HOME/.vim

for f in $PWD/dotfiles/*; do 
    echo "$f -> $HOME/.$(basename $f)"
    ln -s $f $HOME/.$(basename $f)
done
