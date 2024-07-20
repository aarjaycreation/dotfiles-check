# Add paths
export PATH="/usr/sbin:/sbin:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"
export PATH="$HOME/.miniforge3/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export PATH="/opt/homebrew/opt/texlive/bin:$PATH"

# Setup History
HISTSIZE=100000000
SAVEHIST=100000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_VERIFY


#Set EDITOR AND READER
export EDITOR=nvim
export VISUAL=nvim
export READER=mupdf

#THEME
source $ZDOTDIR/themes/gruvbox_dark.zsh

#Completions
autoload -U compinit && compinit
fpath+=$ZDOTDIR/plugins/zsh-completions/src

#Prompt
fpath+=$ZDOTDIR/prompts/pure
autoload -U promptinit; promptinit
prompt pure

source $ZDOTDIR/dotfiles.zsh
source $ZDOTDIR/qol.zsh
source $ZDOTDIR/replacements.zsh
source $ZDOTDIR/overrides.zsh
source $ZDOTDIR/plugins.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/afonso/.miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/afonso/.miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/afonso/.miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/afonso/.miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/afonso/.miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/Users/afonso/.miniforge3/etc/profile.d/mamba.sh"
fi

# <<< conda initialize <<<
eval "$(direnv hook zsh)"
if [[ $(uname) == "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

