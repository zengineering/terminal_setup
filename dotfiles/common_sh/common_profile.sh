#============================
# aliases
#
# bash editing/refreshing/viewing alias sb='source ~/.bashrc'
alias eb='vim ~/.bashrc'

alias sbp='source ~/.bash_profile'
alias ebp='vim ~/.bash_profile'

alias sz='source ~/.zshrc'
alias ez='vim ~/.zshrc'

alias sp='vim ~/.sh_profile'
alias ep='vim ~/.sh_profile'

alias ev='vim ~/.vimrc'

# other stuff
alias mk='make -j8'
alias executable='chmod 755' 
alias cl='clear'
alias cpr="cp -r"
alias vimp='vim -p'

# typos
alias cim='vim'
alias clera='clear'

# vagrant
alias vagrantgo='vagrant up && vagrant ssh'

# git
alias uncommit='git reset --mixed HEAD~'

# show/hide hidden files in OSX
case $OSTYPE in 
darwin*)
    alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
    alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
    alias brewuu='brew update && brew upgrade && brew cleanup'
    ;; 
linux*)
    if [ -f /etc/os-release ]; then
        . /etc/os-release OS=$NAME #VER=$VERSION_ID
        if [ -n $(echo $NAME | grep -iq "arch") ]; then
            alias pacman_remove_orphans='sudo pacman -Rns $(pacman -Qtdq)'
            alias pacman_update='sudo pacman -Syu'
        fi
    fi
    ;;
esac

# tcl
command -v tclsh /dev/null && {
    alias tclsh='rlwrap tclsh'
}

#============================
# Commands
#

# pdf viewing
command -v pdftotext >/dev/null 2>&1 && {
    termpdf() {
        pdftotext -layout -nopgbrk $1 - | less
    }
}

# tmux colors
tmuxcolors() {
    for i in {0..255}; do printf "\x1b[38;5;${i}mcolour%-5i\x1b[0m" $i ; if ! (( ($i + 1 ) % 8 )); then echo ; fi ; done
}


#================================
# Exports
#
# terminal color
export TERM=xterm-256color

# zsh
export ZSH_LOC=$(which zsh)

# Go
command -v go >/dev/null 2>&1 && {
    export GOPATH=$(go env GOPATH)
    export PATH="$PATH:$GOPATH/bin"
}


#================================
# local installs
#
if [ -d $HOME/.local ]; then
    export PATH="$HOME/.local/bin:$PATH"
    export LD_LIBRARY_PATH="$HOME/.local/lib64:$HOME/.local/lib:$LD_LIBRARY_PATH"
    export MANPATH="$HOME/.local/share/man:$MANPATH"
    export INFOPATH="$HOME/.local/share/info:$INFOPATH"
    export C_INCLUDE_PATH="$HOME/.local/include:$C_INCLUDE_PATH"
    export CPLUS_INCLUDE_PATH="$HOME/.local/include:$CPLUS_INCLUDE_PATH"

    if [ -d $HOME/.local/lua_install ]; then
        export PATH="$HOME/.local/lua_install/bin:$PATH"
        export LD_LIBRARY_PATH="$HOME/.local/lua_install/lib:$LD_LIBRARY_PATH"
    fi
fi

if [ -d $HOME/anaconda3 ]; then
    # added by Anaconda3 installer
    export PATH="$HOME/anaconda3/bin:$PATH"
fi

#================================

#================================
# machine-specific profiles
#
if [ -f $HOME/.gtri_mbp_profile ]; then
    source $HOME/.gtri_mbp_profile
fi

if [ -f $HOME/.gtri_server_profile ]; then
    source $HOME/.gtri_server_profile
fi

if [ -f $HOME/.tmpo_ws1_profile ]; then
    source $HOME/.tmpo_ws1_profile
fi

if [ -f $HOME/.toshiba_profile ]; then
    source $HOME/.toshiba_profile
fi

if [ -f $HOME/.silver_profile.sh ]; then
    source $HOME/.silver_profile.sh
fi

if [ -f $HOME/.vagrarch_profile.sh ]; then
    source $HOME/.vagrarch_profile.sh
fi

#================================
# VirtualenvWrapper
#
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
elif [ -f /usr/bin/virtualenvwrapper.sh ]; then
    source /usr/bin/virtualenvwrapper.sh
elif [ -f $HOME/.local/bin/virtualenvwrapper.sh ]; then
    source $HOME/.local/bin/virtualenvwrapper.sh
fi

command -v lsvirtualenv >/dev/null 2>&1 && {
    mkdir -p $HOME/.virtualenv
    export WORKON_HOME="$HOME/.virtualenv"
}

