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
fish_add_path /var/lib/flatpak/exports/bin

source ~/.config/fish/myfunctions/code.fish
source ~/.config/fish/myfunctions/dotfiles.fish
source ~/.config/fish/myfunctions/pacman.fish
source ~/.config/fish/myfunctions/qol.fish
source ~/.config/fish/myfunctions/replacements.fish

starship init fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
