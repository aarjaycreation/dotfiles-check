function ls
    exa --icons -l $argv
end
abbr -a find fd
abbr -a df duf
abbr -a v nvim
function rm
    echo "rm is disabled, use trash instead"
end
