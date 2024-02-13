#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Theme Switcher
# @raycast.mode silent
# @raycast.argument1 { "type": "dropdown","placeholder":"Theme", "data": [{"title": "Catppuccin Frappe", "value": "catppuccin-frappe"},{"title": "Catppuccin Latte", "value": "catppuccin-latte"},{"title": "Gruvbox Material Dark", "value": "gruvbox-material-dark"},{"title": "Gruvbox Material Light", "value": "gruvbox-material-light"}]}
#

alacritty_theme_name=""
zsh_theme_name=""

case $1 in
    "catppuccin-latte")
        alacritty_theme_name="catppuccin_latte"
        zsh_theme_name="catppuccin_latte"

        set +e
        #Clear nvim theme file
        > ~/.config/nvim/lua/core/theme.lua
        echo "vim.cmd('colorscheme catppuccin-latte')" >> ~/.config/nvim/lua/core/theme.lua
        nvim --server /tmp/nvim.pipe --remote-send ':colorscheme catppuccin-latte<CR>'
        set -e
        ;;

    "catppuccin-frappe")
        alacritty_theme_name="catppuccin_frappe"
        zsh_theme_name="catppuccin_frappe"

        set +e
        #Clear nvim theme file
        > ~/.config/nvim/lua/core/theme.lua
        nvim --server /tmp/nvim.pipe --remote-send ':colorscheme catppuccin-frappe<CR>'
        echo "vim.cmd('colorscheme catppuccin-frappe')" >> ~/.config/nvim/lua/core/theme.lua
        set -e
        ;;

    "gruvbox-material-dark")
        alacritty_theme_name="gruvbox_material_dark"
        zsh_theme_name="gruvbox_dark"

        set +e
        #Clear nvim theme file
        > ~/.config/nvim/lua/core/theme.lua
        nvim --server /tmp/nvim.pipe --remote-send ':lua vim.g.gruvbox_material_better_performance = 1<CR>'
        echo "vim.g.gruvbox_material_better_performance = 1" >> ~/.config/nvim/lua/core/theme.lua
        nvim --server /tmp/nvim.pipe --remote-send ':lua vim.g.gruvbox_material_background = "medium"<CR>'
        echo "vim.g.gruvbox_material_background = 'medium'" >> ~/.config/nvim/lua/core/theme.lua
        nvim --server /tmp/nvim.pipe --remote-send ':lua vim.opt.background = "dark"<CR>'
        echo "vim.opt.background = 'dark'" >> ~/.config/nvim/lua/core/theme.lua
        nvim --server /tmp/nvim.pipe --remote-send ':colorscheme gruvbox-material<CR>'
        echo "vim.cmd('colorscheme gruvbox-material')" >> ~/.config/nvim/lua/core/theme.lua
        set -e
        ;;

    "gruvbox-material-light")
        alacritty_theme_name="gruvbox_material_light"
        zsh_theme_name="gruvbox_light"

        set +e
        #Clear nvim theme file
        > ~/.config/nvim/lua/core/theme.lua
        nvim --server /tmp/nvim.pipe --remote-send ':lua vim.g.gruvbox_material_better_performance = 1<CR>'
        echo "vim.g.gruvbox_material_better_performance = 1" >> ~/.config/nvim/lua/core/theme.lua
        nvim --server /tmp/nvim.pipe --remote-send ':lua vim.g.gruvbox_material_background = "soft"<CR>'
        echo "vim.g.gruvbox_material_background = 'soft'" >> ~/.config/nvim/lua/core/theme.lua
        nvim --server /tmp/nvim.pipe --remote-send ':lua vim.opt.background = "light"<CR>'
        echo "vim.opt.background = 'light'" >> ~/.config/nvim/lua/core/theme.lua
        nvim --server /tmp/nvim.pipe --remote-send ':colorscheme gruvbox-material<CR>'
        echo "vim.cmd('colorscheme gruvbox-material')" >> ~/.config/nvim/lua/core/theme.lua
        set -e
        ;;
esac

sed -i '' -e "s|import = \[\"~/.config/alacritty/themes/.*\"\]|import = [\"~/.config/alacritty/themes/${alacritty_theme_name}.toml\"]|g" ~/.config/alacritty/alacritty.toml
sed -i '' -e "s|source \$HOME/.config/zsh/themes/.*zsh|source \$HOME/.config/zsh/themes/${zsh_theme_name}.zsh|g" ~/.zshrc
