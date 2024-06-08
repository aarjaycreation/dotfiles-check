# ~/.config/zsh/replacements.zsh

alias ls="eza --icons -l --sort type"

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


alias lg="lazygit"
alias calcurse-caldav='CALCURSE_CALDAV_PASSWORD=$(keyring get caldav afonso) calcurse-caldav'
