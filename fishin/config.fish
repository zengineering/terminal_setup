if status is-interactive
    # Commands to run in interactive sessions can go here
    theme_gruvbox
    bind --preset \cC 'cancel-commandline'	
    # bind \cc 'echo; commandline ""'
end
source $HOME/.fishin/keys.fish
source $HOME/.fishin/iterm2_shell_integration.fish
fish_add_path $HOME/.local/bin
