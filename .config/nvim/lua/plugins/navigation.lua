return {
    {
        "ThePrimeagen/harpoon",
        event = "VeryLazy",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon.setup()
            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)
        end
    },
    {
        "stevearc/oil.nvim",
        opts = {},
    },
    {
        "alexghergh/nvim-tmux-navigation",
        event = "VeryLazy",
        opts = {
            disable_when_zoomed = true, -- defaults to false
            keybindings = {
                left = "<F5>",
                down = "<F6>",
                up = "<F7>",
                right = "<F8>",
            },
        },
    },
    {
        "declancm/cinnamon.nvim",
        event = "VeryLazy",
        opts = {
            scroll_limit = 10000,
            always_scroll = true,
        },
    },
}