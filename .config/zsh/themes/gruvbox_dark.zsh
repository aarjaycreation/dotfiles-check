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
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#fabd2f'
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
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#fabd2f,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#83a598,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#fabd2f,underline'
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
