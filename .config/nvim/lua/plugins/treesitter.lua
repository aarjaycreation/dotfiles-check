local present, treesitter = pcall(require, "nvim-treesitter.configs")

require('nvim-treesitter.install').update({ with_sync = true })


if not present then
    return
end

local options = {
    ensure_installed = { "lua", "haskell", "rust", "markdown", "markdown_inline" },

    highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = { "markdown" },
    },

    indent = {
        enable = true,
    },
}

treesitter.setup(options)
