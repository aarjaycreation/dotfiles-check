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
--Undo dir
vim.opt.undodir = os.getenv("XDG_STATE_HOME") .. "/nvim/undodir"
vim.opt.undofile = true
--Backup dir
vim.opt.backup = true
vim.opt.backupdir = os.getenv("XDG_STATE_HOME") .. "/nvim/backupdir"
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
vim.g.jukit_mappings = 0
--Format Options
vim.opt.formatoptions:remove("ro")
--Sign gutter always on
vim.opt.signcolumn = "yes"
