return {
    {
        "vimpostor/vim-tpipeline",
        config = function()
            vim.g.tpipeline_restore = 1
            vim.g.tpipeline_autoembed = 1
            vim.o.laststatus = 0
            vim.g.tpipeline_statusline = '%=%l:%c'
        end
    },
    {
        'echasnovski/mini.notify',
        version = false,
        config = function()
            vim.api.nvim_set_hl(0, 'MiniNotifyNormal', { link = 'Normal' })
            vim.api.nvim_set_hl(0, 'MiniNotifyBorder', { link = 'Normal' })
            require("mini.notify").setup()
        end
    },
    --Better quick fix
    {
        'kevinhwang91/nvim-bqf',
        event = "VeryLazy",
        ft = 'qf'
    },
}
