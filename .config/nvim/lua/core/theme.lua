-- Themery block
-- This block will be replaced by Themery.
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
vim.opt.background = "light"


vim.cmd("colorscheme catppuccin-latte")
vim.g.theme_id = 4
-- end themery block
