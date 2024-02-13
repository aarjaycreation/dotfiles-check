--Leader
vim.g.mapleader = " "
--termguicolors
vim.opt.termguicolors = true
--Relative line numbers
vim.wo.number=true
vim.wo.relativenumber= true
--Remove search highlight
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartindent = true
--Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--Change word definition
vim.opt.iskeyword:append("-")
vim.opt.iskeyword:append("_")
--Remove Wrap
vim.opt.wrap = false
--Not let cursor go bellow 10 chars.
vim.opt.scrolloff = 10
--4 space indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
--quickfix keybinds 
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--buffer keybinds
vim.keymap.set("n", "<A-h>", "<cmd>bp<CR>")
vim.keymap.set("n", "<A-l>", "<cmd>bn<CR>")
--Undo dir
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
--Org mode hide links
vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'
--Jupyter notebooks
vim.g.jukit_convert_overwrite_default = 1
vim.g.jukit_convert_open_default = 0
vim.g.jukit_shell_cmd = 'ipython3'
vim.g.jukit_terminal = 'nvimterm'
vim.g.jukit_show_prompt = 1
vim.g.jukit_pdf_viewer = 'zathura'
vim.g.jukit_mappings = 1
