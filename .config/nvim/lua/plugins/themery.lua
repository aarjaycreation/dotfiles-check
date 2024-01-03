require("themery").setup({
    themes = { {
        name = "Gruvbox dark",
        colorscheme = "gruvbox",
        before = [[
      vim.opt.background = "dark"
    ]],
    },
        {
            name = "Gruvbox light",
            colorscheme = "gruvbox",
            before = [[
      vim.opt.background = "light"
    ]]
        },
        {
            name = "Catppuccin Frappe",
            colorscheme = "catppuccin-frappe",
            before = [[
                require("catppuccin").setup({
                    flavour = "frappe", -- latte, frappe, macchiato, mocha
                    styles = {
                        comments = { "italic" },
                        conditionals = { "italic" },
                    },
                    integrations = {
                        cmp = true,
                        treesitter = true,
                        treesitter_context = true,
                        fidget = true,
                        telescope = true,
                        leap = true,
                        mason = true,
                        native_lsp = {
                            enabled = true,
                            virtual_text = {
                                errors = { "italic" },
                                hints = { "italic" },
                                warnings = { "italic" },
                                information = { "italic" },
                            },
                            underlines = {
                                errors = { "underline" },
                                hints = { "underline" },
                                warnings = { "underline" },
                                information = { "underline" },
                            },
                        },
                    },
                })
    ]]
        },
        {
            name = "Catppuccin Latte",
            colorscheme = "catppuccin-latte",
            before = [[
                require("catppuccin").setup({
                    flavour = "latte", -- latte, frappe, macchiato, mocha
                    styles = {
                        comments = { "italic" },
                        conditionals = { "italic" },
                    },
                    integrations = {
                        cmp = true,
                        treesitter = true,
                        treesitter_context = true,
                        fidget = true,
                        telescope = true,
                        leap = true,
                        mason = true,
                        native_lsp = {
                            enabled = true,
                            virtual_text = {
                                errors = { "italic" },
                                hints = { "italic" },
                                warnings = { "italic" },
                                information = { "italic" },
                            },
                            underlines = {
                                errors = { "underline" },
                                hints = { "underline" },
                                warnings = { "underline" },
                                information = { "underline" },
                            },
                        },
                    },
                })
    ]]
        },
    },
    themeConfigFile = "~/.config/nvim/lua/core/theme.lua", -- Described below
    livePreview = true,                                    -- Apply theme while browsing. Default to true.
})
