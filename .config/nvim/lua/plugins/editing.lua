return {
    {
        "tpope/vim-surround",
        event = "VeryLazy",
    },
    {
        "mbbill/undotree",
        event = "VeryLazy",
    },
    {
        "windwp/nvim-autopairs",
        event = "VeryLazy",
        config = function()
            local npairs = require('nvim-autopairs')

            npairs.setup({
                map_cr = true,
                map_bs = true,
                check_ts = true,
                enable_check_bracket_line = true,
                ignored_next_char = "[%w]"
            })
        end,
    },
}
