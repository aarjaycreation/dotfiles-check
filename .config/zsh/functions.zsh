function vim {
    if [[ -z "$@" ]]; then
        if [[ -f "./.session.vim" ]]; then
            nvim -S .session.vim --listen /tmp/nvim.pipe -c 'lua vim.g.savesession = true'
        else
            nvim --listen /tmp/nvim.pipe -c 'lua vim.g.savesession = true'
        fi
    else
        nvim --listen /tmp/nvim.pipe "$@"
    fi
}

function sourceall(){
    set -e
    pids=$(pgrep zsh)
    while IFS= read -r pid; do
        kill -USR1 "$pid"
    done <<< "$pids"
    set +e
}


function routevpn(){
        sudo route -n add $1 10.8.0.1
}

alias ls="eza --icons -l --sort type"
alias lg="lazygit"
alias calcurse-caldav='CALCURSE_CALDAV_PASSWORD=$(keyring get caldav afonso) calcurse-caldav'
alias routes="netstat -rn -f inet"
