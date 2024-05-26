# ~/.config/zsh/replacements.zsh

alias ls="eza --icons -l --sort type"

alias vim="nvim --listen /tmp/nvim.pipe"

alias lg="lazygit"
alias calcurse-caldav='CALCURSE_CALDAV_PASSWORD=$(keyring get caldav afonso) calcurse-caldav'
