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

alias find="fd"
alias df="duf"
alias lg="lazygit"


