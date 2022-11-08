if status is-interactive
    # Commands to run in interactive sessions can go here
end

bind \cH backward-kill-path-component
bind "[3;5~" kill-word

function config
  /usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME $argv
end

#Vim mode
fish_vi_key_bindings

function vim
	nvim $argv
end

function core
    xhost +local:root
    sudo docker exec -it core core-gui
end

function i
	sudo pacman -S $argv
end

function u
	sudo pacman -Syu $argv 
end

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/afonso/.ghcup/bin $PATH # ghcup-env
set PATH $HOME/.local/bin $HOME/.cargo/bin $HOME/.local/bin $PATH
