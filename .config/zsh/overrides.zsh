ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)

if [[ ! $(tty) =~ ^/dev/tty[0-9]*$ ]]; then
    ZSH_TMUX_AUTOSTART=true
fi

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
