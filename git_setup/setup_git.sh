#!/bin/bash

command -v git >/dev/null 2>&1 && {

    case $OSTYPE in 
        darwin*)
            SCRIPT_PATH=$(dirname "$(greadlink -f "$0")")
        ;;
        linux*)
            SCRIPT_PATH=$(dirname "$(readlink -f "$0")")
        ;;
    esac
    
    git config --global user.name 'zane'
    git config --global user.email 'zane@localhost'
    
    git config --global init.templatedir "$HOME/.git_template"
    mkdir -p $HOME/.git_template/hooks
    
    for git_file in ctags post-checkout post-commit post-merge post-rewrite; do
        ln -s $SCRIPT_PATH/$git_file $HOME/.git_template/hooks/$git_file
    done
    
    git config --global alias.ctags '!.git/hooks/ctags'
    
} || echo "Can't run git setup without git installed."
