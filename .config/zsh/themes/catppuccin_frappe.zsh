# Catppuccin Frappe Theme (for zsh-syntax-highlighting)
#
# Paste this files contents inside your ~/.zshrc before you activate zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES

# Main highlighter styling: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
#
## General
### Diffs
### Markup
## Classes
## Comments
ZSH_HIGHLIGHT_STYLES[comment]='fg=#626880'
## Constants
## Entitites
## Functions/methods
ZSH_HIGHLIGHT_STYLES[alias]='fg=#a6d189'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#a6d189'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#a6d189'
ZSH_HIGHLIGHT_STYLES[function]='fg=#a6d189'
ZSH_HIGHLIGHT_STYLES[command]='fg=#a6d189'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#a6d189,italic'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#ef9f76,italic'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#ef9f76'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#ef9f76'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#ca9ee6'
## Keywords
## Built ins
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#a6d189'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#a6d189'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#a6d189'
## Punctuation
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#e78284'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#c6d0f5'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#c6d0f5'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#c6d0f5'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#e78284'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#e78284'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#e78284'
## Serializable / Configuration Languages
## Storage
## Strings
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#e5c890'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#e5c890'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#e5c890'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#ea999c'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#e5c890'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#ea999c'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#e5c890'
## Variables
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#c6d0f5'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#ea999c'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#c6d0f5'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#c6d0f5'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#c6d0f5'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#c6d0f5'
## No category relevant in spec
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ea999c'
ZSH_HIGHLIGHT_STYLES[path]='fg=#c6d0f5,underline'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#e78284,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#c6d0f5,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#e78284,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#c6d0f5'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#ca9ee6'
#ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=?'
#ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=?'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#ea999c'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#c6d0f5'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#c6d0f5'
ZSH_HIGHLIGHT_STYLES[default]='fg=#c6d0f5'
ZSH_HIGHLIGHT_STYLES[cursor]='fg=#c6d0f5'

#Pure prompt
# Define cappuccin frappe colors
pure_prompt_colors() {
    local colors
    colors=(
        execution_time='%F{#bdae93}'           # The execution time of the last command when exceeding PURE_CMD_MAX_EXEC_TIME.
        git:arrow='%F{#bdae93}'                 # For PURE_GIT_UP_ARROW and PURE_GIT_DOWN_ARROW.
        git:stash='%F{#bdae93}'                 # For PURE_GIT_STASH_SYMBOL.
        git:branch='%F{#98971a}'                # The name of the current branch when in a Git repository.
        git:branch:cached='%F{#cc241d}'         # The name of the current branch when the data isn't fresh.
        git:action='%F{#b16286}'                # The current action in progress (cherry-pick, rebase, etc.) when in a Git repository.
        git:dirty='%F{#d65d0e}'                 # The asterisk showing the branch is dirty.
        host='%F{#7c6f64}'                      # The hostname when on a remote machine.
        path='%F{#458588}'                      # The current path, for example, PWD.
        prompt:error='%F{#fb4934}'              # The PURE_PROMPT_SYMBOL when the previous command has failed.
        prompt:success='%F{#98971a}'            # The PURE_PROMPT_SYMBOL when the previous command has succeeded.
        prompt:continuation='%F{#b16286}'       # The color for showing the state of the parser in the continuation prompt (PS2).
        suspended_jobs='%F{#fb4934}'            # The ✦ symbol indicates that jobs are running in the background.
        user='%F{#7c6f64}'                      # The username when on remote machine.
        user:root='%F{default}'                 # The username when the user is root.
        virtualenv='%F{#b16286}'                # The name of the Python virtualenv when in use.
    )
    (( $#colors )) || echo $colors
}

# Apply cappuccin frappe colors to Zsh Pure prompt
for color in $(pure_prompt_colors); do
    zstyle ":prompt:pure:$color" color "$color"
done
