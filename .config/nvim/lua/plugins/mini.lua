return {
    {
        'echasnovski/mini.ai',
        version = false,
        opts = {}
    },

    {
        'echasnovski/mini.notify',
        version = false,
        config = function()
            vim.api.nvim_set_hl(0, 'MiniNotifyNormal', { link = 'Normal' })
            vim.api.nvim_set_hl(0, 'MiniNotifyBorder', { link = 'Normal' })
            require("mini.notify").setup({
                -- Window options
                window = {
                    -- Floating window config
                    config = {},
                    -- Value of 'winblend' option
                },

            })
        end
    },
}
