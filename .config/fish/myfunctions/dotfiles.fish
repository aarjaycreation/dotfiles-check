function config
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME $argv
end

abbr -a lc "lazygit --git-dir=$HOME/dotfiles/ --work-tree=$HOME/"


