
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY

export EDITOR=nvim
export READER=mupdf



#if [ "$(arch)" = "arm64" ]; then
eval "$(/opt/homebrew/bin/brew shellenv)"
#else
#    eval "$(/usr/local/bin/brew shellenv)"
#fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
enable-fzf-tab

# opam configuration
source $HOME/.opam/opam-init/init.zsh > /dev/null 2>&1 || true

eval "$(zoxide init zsh)"

eval "$(direnv hook zsh)"
