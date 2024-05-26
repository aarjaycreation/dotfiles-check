local telescope = require('telescope')
local actions = require("telescope.actions")

telescope.setup {
    defaults = {
        layout_strategy = "horizontal",
        path_display = { "filename_first" },
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
    },
    pickers = {
        find_files = {
            previewer = false,
            layout_strategy = "center",
            layout_config = {
                height = 0.7,
                width = 0.5
            },
        },
        live_grep = {
            only_sort_text = true,
            previewer = true,
        }
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_cursor {}
        }
    }
}
telescope.load_extension('fzf')
telescope.load_extension("ui-select")
--local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
--vim.keymap.set('n', '<leader>fe', builtin.diagnostics, {})
--vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
--vim.keymap.set('n', '<leader>fs', builtin.treesitter, {})
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
