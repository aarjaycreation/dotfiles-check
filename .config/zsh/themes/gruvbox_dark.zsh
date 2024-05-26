# Gruvbox Material Dark Medium Theme (for zsh-syntax-highlighting)
#
# Paste this file's contents inside your ~/.zshrc before you activate zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES

# Main highlighter styling: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
#
## General
### Diffs
### Markup
## Classes
## Comments
ZSH_HIGHLIGHT_STYLES[comment]='fg=#928374'
## Constants
## Entitites
## Functions/methods
ZSH_HIGHLIGHT_STYLES[alias]='fg=#b8bb26'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#b8bb26'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#b8bb26'
ZSH_HIGHLIGHT_STYLES[function]='fg=#b8bb26'
ZSH_HIGHLIGHT_STYLES[command]='fg=#b8bb26'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#b8bb26,italic'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#fe8019,italic'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#fe8019'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#fe8019'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#d3869b'
## Keywords
## Built ins
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#b8bb26'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#b8bb26'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#b8bb26'
## Punctuation
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#d4be98'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#83a598'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#83a598'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#83a598'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#ebdbb2'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#ebdbb2'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#ebdbb2'
## Serializable / Configuration Languages
## Storage
## Strings
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#fabd2f'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#fabd2f'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#83a598'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#fb4934'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#83a598'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#fb4934'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#83a598'
## Variables
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#83a598'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#fb4934'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#83a598'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#83a598'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#83a598'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#83a598'
## No category relevant in spec
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#fb4934'
ZSH_HIGHLIGHT_STYLES[path]='fg=#83a598,underline'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#d4be98,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#83a598,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#d4be98,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#83a598'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#d3869b'
#ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=?'
#ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=?'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#fb4934'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#83a598'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#83a598'
ZSH_HIGHLIGHT_STYLES[default]='fg=#83a598'
ZSH_HIGHLIGHT_STYLES[cursor]='fg=#83a598'
#ZSH Syntax Highlighting
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#928374,italic,underline"



#Pure prompt
# Define gruvbox dark colors
pure_prompt_colors() {
    local colors
    colors=(
        execution_time='%F{#fabd2f}'           # The execution time of the last command when exceeding PURE_CMD_MAX_EXEC_TIME.
        git:arrow='%F{#83a598}'                 # For PURE_GIT_UP_ARROW and PURE_GIT_DOWN_ARROW.
        git:stash='%F{#83a598}'                 # For PURE_GIT_STASH_SYMBOL.
        git:branch='%F{#b8bb26}'                # The name of the current branch when in a Git repository.
        git:branch:cached='%F{#fb4934}'         # The name of the current branch when the data isn't fresh.
        git:action='%F{#d3869b}'                # The current action in progress (cherry-pick, rebase, etc.) when in a Git repository.
        git:dirty='%F{#fe8019}'                 # The asterisk showing the branch is dirty.
        host='%F{#ebdbb2}'                      # The hostname when on a remote machine.
        path='%F{#83a598}'                      # The current path, for example, PWD.
        prompt:error='%F{#fb4934}'              # The PURE_PROMPT_SYMBOL when the previous command has failed.
        prompt:success='%F{#b16286}'            # The PURE_PROMPT_SYMBOL when the previous command has succeeded.
        prompt:continuation='%F{#d3869b}'       # The color for showing the state of the parser in the continuation prompt (PS2).
        suspended_jobs='%F{#fb4934}'            # The ✦ symbol indicates that jobs are running in the background.
        user='%F{#ebdbb2}'                      # The username when on remote machine.
        user:root='%F{default}'                 # The username when the user is root.
        virtualenv='%F{#d3869b}'                # The name of the Python virtualenv when in use.
    )
    (( $#colors )) || echo $colors
}

# Apply gruvbox dark colors to Zsh Pure prompt
for color in $(pure_prompt_colors); do
    zstyle ":prompt:pure:$color" color "$color"
done

# FZF
# # Scheme name: Gruvbox dark, hard
# Scheme system: base16
# Scheme author: Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)
# Template author: Tinted Theming (https://github.com/tinted-theming)

_gen_fzf_default_opts() {

local color00='#1d2021'
local color01='#3c3836'
local color02='#504945'
local color03='#665c54'
local color04='#bdae93'
local color05='#d5c4a1'
local color06='#ebdbb2'
local color07='#fbf1c7'
local color08='#fb4934'
local color09='#fe8019'
local color0A='#fabd2f'
local color0B='#b8bb26'
local color0C='#8ec07c'
local color0D='#83a598'
local color0E='#d3869b'
local color0F='#d65d0e'

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"\
" --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D"\
" --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C"\
" --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"

}

_gen_fzf_default_opts

