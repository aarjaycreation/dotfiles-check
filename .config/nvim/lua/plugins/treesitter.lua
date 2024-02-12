local present, treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

require('nvim-treesitter.install').update({ with_sync = true })
local present, orgmode = pcall(require, "orgmode")
if present then
    require('orgmode').setup_ts_grammar()
end



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
}

treesitter.setup(options)
