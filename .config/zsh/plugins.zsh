source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

source $ZDOTDIR/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh

source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

source $ZDOTDIR/plugins/fzf-tab/fzf-tab.plugin.zsh
enable-fzf-tab

source $ZDOTDIR/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
zvm_after_init_commands+=('[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh')

source $ZDOTDIR/plugins/zsh-macos.plugin.zsh

source $ZDOTDIR/plugins/zsh-git.plugin.zsh

source $ZDOTDIR/plugins/zsh-sudo.plugins.zsh
