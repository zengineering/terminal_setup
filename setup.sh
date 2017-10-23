link_dotfiles() {
    for f in $PWD/dotfiles/$1/*; do 
        echo "$f -> $HOME/.$(basename $f)"
        if [ -f $HOME/.$(basename $f) ]; then
            mv $HOME/.$(basename $f) $HOME/.$(basename $f).bak
        fi
        ln -s $f $HOME/.$(basename $f)
    done
}

if [ $(basename $PWD) != terminal_setup ]; then
    echo "Run from terminal_setup dir."
    exit 1
fi

ln -s $PWD $HOME/.terminal_setup
ln -s $PWD $HOME/.vim
ln -s $PWD/tmux-plugins $HOME/.tmux

link_dotfiles vim
link_dotfiles tmux
link_dotfiles bash
link_dotfiles zsh
link_dotfiles common_sh

