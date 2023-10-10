if status is-interactive
    # Commands to run in interactive sessions can go here
end
fish_default_key_bindings

set -gx EDITOR nvim
set -gx READER mupdf

fish_add_path $HOME/.bun/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/.local/share/nvim/mason/bin
fish_add_path /home/afonso/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.ghcup/bin
fish_add_path /usr/bin/vendor_perl

source ~/.config/fish/myfunctions/code.fish
source ~/.config/fish/myfunctions/dotfiles.fish
source ~/.config/fish/myfunctions/pacman.fish
source ~/.config/fish/myfunctions/qol.fish
source ~/.config/fish/myfunctions/replacements.fish


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/afonso/miniconda3/bin/conda
    eval /home/afonso/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<
conda deactivate

direnv hook fish | source

starship init fish | source

