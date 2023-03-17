if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_default_key_bindings

set -gx EDITOR vim
set -gx TERM 'xterm-256color'

fish_add_path $HOME/.local/share/nvim/mason/bin
fish_add_path /home/afonso/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin
fish_add_path $HOME/.local/bin 
fish_add_path $HOME/.cargo/bin 

source ~/.config/fish/myfunctions/code.fish
source ~/.config/fish/myfunctions/dotfiles.fish
source ~/.config/fish/myfunctions/pacman.fish
source ~/.config/fish/myfunctions/qol.fish
