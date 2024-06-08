--Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--quickfix keybinds
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
--buffer keybinds
vim.keymap.set("n", "<A-h>", "<cmd>bp<CR>")
vim.keymap.set("n", "<A-l>", "<cmd>bn<CR>")
--jk as escape
vim.keymap.set("i", "jk","<esc>")
