ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

source $ZDOTDIR/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh

source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

zvm_after_init_commands+=('[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh')
source $ZDOTDIR/plugins/fzf-tab/fzf-tab.plugin.zsh
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
enable-fzf-tab

source $ZDOTDIR/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

source $ZDOTDIR/plugins/zsh-macos.plugin.zsh

source $ZDOTDIR/plugins/zsh-git.plugin.zsh

source $ZDOTDIR/plugins/zsh-sudo.plugins.zsh

source $ZDOTDIR/plugins/zsh-tmux.plugins.zsh
