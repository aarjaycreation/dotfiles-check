#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Theme Switcher
# @raycast.mode silent
# @raycast.argument1 { "type": "dropdown","placeholder":"Theme", "data": [{"title": "Catppuccin Frappe", "value": "catppuccin-frappe"},{"title": "Catppuccin Latte", "value": "catppuccin-latte"},{"title": "Gruvbox Dark", "value": "gruvbox-dark"},{"title": "Gruvbox Light", "value": "gruvbox-light"}]}
#

alacritty_theme_name=""
zsh_theme_name=""
background_color=""
nvim_color_scheme=""
tmux_bar_unfocused_fg=""
tmux_bar_focused_bg=""
tmux_bar_focused_fg=""

change_common(){
    #Change alacritty theme
    sed -i '' -e "s|import = \[\"~/.config/alacritty/themes/.*\"\]|import = [\"~/.config/alacritty/themes/${alacritty_theme_name}.toml\"]|g" ~/.config/alacritty/alacritty.toml
    #Change zsh theme
    sed -i '' -e "s|source \$HOME/.config/zsh/themes/.*zsh|source \$HOME/.config/zsh/themes/${zsh_theme_name}.zsh|g" ~/.zshrc
    #Reload zsh sessions
    pids=$(pgrep zsh)
    while IFS= read -r pid; do
        kill -USR1 "$pid"
    done <<< "$pids"

    #Change tmux theme
    sed -i '' -E "s/set -g status-bg .*$/set -g status-bg \"$background_color\"/" ~/.config/tmux/tmux_status_bar.conf
    sed -i '' -E "s/set -g @unfocused-fg .*$/set -g @unfocused-fg \"$tmux_bar_unfocused_fg\"/" ~/.config/tmux/tmux_status_bar.conf
    sed -i '' -E "s/set -g @focused-bg .*$/set -g @focused-bg \"$tmux_bar_focused_bg\"/" ~/.config/tmux/tmux_status_bar.conf
    sed -i '' -E "s/set -g @focused-fg .*$/set -g @focused-fg \"$tmux_bar_focused_fg\"/" ~/.config/tmux/tmux_status_bar.conf


    #Reload tmux sessions
    tmux source-file ~/.config/tmux/tmux.conf

    echo "vim.cmd('colorscheme ${nvim_color_scheme}')" >> ~/.config/nvim/lua/core/theme.lua
    nvim --server /tmp/nvim.pipe --remote-send ":colorscheme ${nvim_color_scheme}<CR>" || true
}

case $1 in
    "catppuccin-latte")
        alacritty_theme_name="catppuccin_latte"
        zsh_theme_name="catppuccin_latte"
        nvim_color_scheme="catppuccin-latte"
        background_color="#eff1f5"
        tmux_bar_unfocused_fg="#4c4f69"
        tmux_bar_focused_bg="#4c4f69"
        tmux_bar_focused_fg="#eff1f5"

        echo '' > ~/.config/nvim/lua/core/theme.lua
        change_common
        ;;

    "catppuccin-frappe")
        alacritty_theme_name="catppuccin_frappe"
        zsh_theme_name="catppuccin_frappe"
        nvim_color_scheme="catppuccin-frappe"
        background_color="#303446"
        tmux_bar_unfocused_fg="#c6d0f5"
        tmux_bar_focused_bg="#c6d0f5"
        tmux_bar_focused_fg="#303446"

        echo '' > ~/.config/nvim/lua/core/theme.lua
        change_common
        ;;

    "gruvbox-dark")
        alacritty_theme_name="gruvbox_dark"
        zsh_theme_name="gruvbox_dark"
        nvim_color_scheme="gruvbox-material"
        background_color="#282828"
        tmux_bar_unfocused_fg="#d4be98"
        tmux_bar_focused_bg="#d4be98"
        tmux_bar_focused_fg="#282828"


        nvim --server /tmp/nvim.pipe --remote-send ':lua vim.g.gruvbox_material_better_performance = 1<CR>' || true
        echo "vim.g.gruvbox_material_better_performance = 1" > ~/.config/nvim/lua/core/theme.lua
        nvim --server /tmp/nvim.pipe --remote-send ':lua vim.g.gruvbox_material_background = "medium"<CR>' || true
        echo "vim.g.gruvbox_material_background = 'medium'" >> ~/.config/nvim/lua/core/theme.lua
        nvim --server /tmp/nvim.pipe --remote-send ':lua vim.opt.background = "dark"<CR>' || true
        echo "vim.opt.background = 'dark'" >> ~/.config/nvim/lua/core/theme.lua

        change_common
        ;;

    "gruvbox-light")
        alacritty_theme_name="gruvbox_light"
        zsh_theme_name="gruvbox_light"
        nvim_color_scheme="gruvbox-material"
        background_color="#f2e5bc"
        tmux_bar_unfocused_fg="#654735"
        tmux_bar_focused_bg="#654735"
        tmux_bar_focused_fg="#f2e5bc"


        nvim --server /tmp/nvim.pipe --remote-send ':lua vim.g.gruvbox_material_better_performance = 1<CR>' || true
        echo "vim.g.gruvbox_material_better_performance = 1" > ~/.config/nvim/lua/core/theme.lua
        nvim --server /tmp/nvim.pipe --remote-send ':lua vim.g.gruvbox_material_background = "soft"<CR>' || true
        echo "vim.g.gruvbox_material_background = 'soft'" >> ~/.config/nvim/lua/core/theme.lua
        nvim --server /tmp/nvim.pipe --remote-send ':lua vim.opt.background = "light"<CR>' || true
        echo "vim.opt.background = 'light'" >> ~/.config/nvim/lua/core/theme.lua

        change_common

        ;;
esac
