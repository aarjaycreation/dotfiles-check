local present, treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

require('nvim-treesitter.install').update({ with_sync = true })


local options = {
    ensure_installed = { "c", "lua", "haskell", "rust", "markdown", "org" },

    highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = { "org" },
    },
    indent = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",
            },
            selection_modes = {
                ['@block.outer'] = 'v', -- charwise
                ['@block.inner'] = 'v', -- charwise
                ['@function.outer'] = 'V', -- linewise
            },
            include_surrounding_whitespace = true,
        },
    },
}

treesitter.setup(options)
