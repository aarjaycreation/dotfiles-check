if status is-interactive
    # Commands to run in interactive sessions can go here
end

bind \cH backward-kill-path-component
bind "[3;5~" kill-word

function config
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME $argv
end

#Vim mode
#fish_vi_key_bindings
fish_default_key_bindings
function vim
	nvim $argv
end

function launch-term
	docker exec -it core xterm -bg black -fg white -fa 'DejaVu Sans Mono' -fs 16 -e vcmd -c /tmp/pycore.1/$argv -- sh -c "cd /rust-cc && /bin/bash"
end

function cat
    bat $argv
end

function core
    xhost +local:root
    sudo docker exec -it core core-gui
end

function i
	sudo pacman -S $argv
end

function s
	sudo pacman -Ss $argv
end

function u
	sudo pacman -Syu $argv 
end

function mónade
	ghci $argv
end 

set -gx EDITOR vim
set -gx TERM 'xterm-256color'

fish_add_path $HOME/.nix-profile/bin
fish_add_path /var/lib/snapd/snap/bin
fish_add_path $HOME/.local/share/nvim/mason/bin
#set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/afonso/.ghcup/bin $PATH # ghcup-env
fish_add_path /home/afonso/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin
fish_add_path $HOME/.local/bin 
fish_add_path $HOME/.cargo/bin 


set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/afonso/.ghcup/bin $PATH # ghcup-env
