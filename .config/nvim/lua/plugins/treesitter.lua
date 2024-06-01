return {

    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects'
        },
        config = function()
            local treesitter = require("nvim-treesitter.configs")

            require('nvim-treesitter.install').update({ with_sync = true })


            local options = {
                ensure_installed = { "c", "lua", "haskell", "markdown" },

                highlight = {
                    enable = true,
                    use_languagetree = true,
                    additional_vim_regex_highlighting = { "org" },
                },
                indent = {
                    enable = true,
                },
            }

            treesitter.setup(options)
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "VeryLazy",
        config = function()
            require 'treesitter-context'.setup()
        end,
    },
    {
        'echasnovski/mini.ai',
        event = "VeryLazy",
        version = false,
        opts = {}
    },
}
