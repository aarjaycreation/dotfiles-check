-- Create new code cell below. Argument: Whether to create code cell (0) or markdown cell (1)
vim.api.nvim_set_keymap('n', '<leader>jco', ':call jukit#cells#create_below(0)<CR>', { noremap = true, silent = true})
-- Create new code cell above. Argument: Whether to create code cell (0) or markdown cell (1)
vim.api.nvim_set_keymap('n', '<leader>jcO', ':call jukit#cells#create_above(0)<CR>', { noremap = true, silent = true})

-- Create new text (markdown) cell below. Argument: Whether to create code cell (0) or markdown cell (1)
vim.api.nvim_set_keymap('n', '<leader>jct', ':call jukit#cells#create_below(1)<CR>', { noremap = true, silent = true })
-- Create new text (markdown) cell above. Argument: Whether to create code cell (0) or markdown cell (1)
vim.api.nvim_set_keymap('n', '<leader>jcT', ':call jukit#cells#create_above(1)<CR>', { noremap = true, silent = true })

-- Deletes the current cell
vim.api.nvim_set_keymap('n', '<leader>jcd', ':call jukit#cells#delete()<CR>', { noremap = true, silent = true })

-- Send current section (argument: 0 indicates the current section)
vim.api.nvim_set_keymap('n', '<leader>jcc', ':call jukit#send#section(0)<CR>', { noremap = true, silent = true })

-- Send all sections up to the current section
vim.api.nvim_set_keymap('n', '<leader>jcac', ':call jukit#send#until_current_section()<CR>', { noremap = true, silent = true })

-- Send all sections
vim.api.nvim_set_keymap('n', '<leader>jca', ':call jukit#send#all()<CR>', { noremap = true, silent = true })

-- Open an output split
vim.api.nvim_set_keymap('n', '<leader>jos', ':call jukit#splits#output()<CR>', { noremap = true, silent = true })


