# ~/.config/zsh/replacements.zsh

ls() {
    eza --icons -l --sort type "$@"
}

nvim() {
    /opt/homebrew/bin/nvim --listen /tmp/nvim.pipe "$@"
}

vim() {
    /opt/homebrew/bin/nvim --listen /tmp/nvim.pipe "$@"
}

v() {
    /opt/homebrew/bin/nvim --listen /tmp/nvim.pipe "$@"
}

alias lg="lazygit"
alias calcurse-caldav='CALCURSE_CALDAV_PASSWORD=$(keyring get caldav afonso) calcurse-caldav'
