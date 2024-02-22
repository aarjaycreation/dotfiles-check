# Catppuccin Latte Theme (for zsh-syntax-highlighting)
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
ZSH_HIGHLIGHT_STYLES[comment]='fg=#acb0be'
## Constants
## Entitites
## Functions/methods
ZSH_HIGHLIGHT_STYLES[alias]='fg=#40a02b'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#40a02b'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#40a02b'
ZSH_HIGHLIGHT_STYLES[function]='fg=#40a02b'
ZSH_HIGHLIGHT_STYLES[command]='fg=#40a02b'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#40a02b,italic'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#fe640b,italic'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#fe640b'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#fe640b'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#8839ef'
## Keywords
## Built ins
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#40a02b'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#40a02b'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#40a02b'
## Punctuation
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#d20f39'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#d20f39'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#d20f39'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#d20f39'
## Serializable / Configuration Languages
## Storage
## Strings
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#df8e1d'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#df8e1d'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#df8e1d'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#e64553'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#df8e1d'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#e64553'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#df8e1d'
## Variables
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#e64553'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#4c4f69'
## No category relevant in spec
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#e64553'
ZSH_HIGHLIGHT_STYLES[path]='fg=#4c4f69,underline'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#d20f39,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#4c4f69,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#d20f39,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#8839ef'
#ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=?'
#ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=?'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#e64553'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[default]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[cursor]='fg=#4c4f69'

#Pure prompt
# Define cappuccin latte colors
pure_prompt_colors() {
    local colors
    colors=(
        execution_time='%F{#bdae93}'           # The execution time of the last command when exceeding PURE_CMD_MAX_EXEC_TIME.
        git:arrow='%F{#458588}'                 # For PURE_GIT_UP_ARROW and PURE_GIT_DOWN_ARROW.
        git:stash='%F{#bdae93}'                 # For PURE_GIT_STASH_SYMBOL.
        git:branch='%F{#98971a}'                # The name of the current branch when in a Git repository.
        git:branch:cached='%F{#cc241d}'         # The name of the current branch when the data isn't fresh.
        git:action='%F{#b16286}'                # The current action in progress (cherry-pick, rebase, etc.) when in a Git repository.
        git:dirty='%F{#d65d0e}'                 # The asterisk showing the branch is dirty.
        host='%F{#7c6f64}'                      # The hostname when on a remote machine.
        path='%F{#458588}'                      # The current path, for example, PWD.
        prompt:error='%F{#cc241d}'              # The PURE_PROMPT_SYMBOL when the previous command has failed.
        prompt:success='%F{#98971a}'            # The PURE_PROMPT_SYMBOL when the previous command has succeeded.
        prompt:continuation='%F{#b16286}'       # The color for showing the state of the parser in the continuation prompt (PS2).
        suspended_jobs='%F{#cc241d}'            # The ✦ symbol indicates that jobs are running in the background.
        user='%F{#7c6f64}'                      # The username when on remote machine.
        user:root='%F{default}'                 # The username when the user is root.
        virtualenv='%F{#b16286}'                # The name of the Python virtualenv when in use.
    )
    (( $#colors )) || echo $colors
}

# Apply cappuccin latte colors to Zsh Pure prompt
for color in $(pure_prompt_colors); do
    zstyle ":prompt:pure:$color" color "$color"
done
