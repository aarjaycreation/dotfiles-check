# ~/.config/zsh/myfunctions/dotfiles.zsh

config() {
    /usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME $argv
}

alias lc="lazygit --git-dir=$HOME/dotfiles/ --work-tree=$HOME/"

