ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)
ZSH_TMUX_AUTOSTART=true
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
