function config
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME $argv
end

function lazyconfig
    lazygit --git-dir=$HOME/dotfiles/ --work-tree=$HOME/ $argv
end
alias lc=lazyconfig


