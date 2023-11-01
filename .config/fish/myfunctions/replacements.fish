function ls
    eza --icons -l --sort type $argv
end
function nvim
    /usr/bin/nvim --listen /tmp/nvim.pipe $argv
end
function vim
    /usr/bin/nvim --listen /tmp/nvim.pipe $argv
end
abbr -a find fd
abbr -a df duf
abbr -a lg lazygit
function rm
    echo "rm is disabled, use trash instead"
end
