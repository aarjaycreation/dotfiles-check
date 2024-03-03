local opts = { noremap = true, silent = true, buffer = true }
--Convert between py and ipynb
vim.keymap.set('n', '<leader>jnp', '<cmd>call jukit#convert#notebook_convert()<CR>', opts)
-- Create new code cell below. Argument: Whether to create code cell (0) or markdown cell (1)
vim.keymap.set('n', '<leader>jco', '<cmd>call jukit#cells#create_below(0)<CR>', opts)
-- Create new code cell above. Argument: Whether to create code cell (0) or markdown cell (1)
vim.keymap.set('n', '<leader>jcO', '<cmd>call jukit#cells#create_above(0)<CR>', opts)

-- Create new text (markdown) cell below. Argument: Whether to create code cell (0) or markdown cell (1)
vim.keymap.set('n', '<leader>jct', '<cmd>call jukit#cells#create_below(1)<CR>', opts)
-- Create new text (markdown) cell above. Argument: Whether to create code cell (0) or markdown cell (1)
vim.keymap.set('n', '<leader>jcT', '<cmd>call jukit#cells#create_above(1)<CR>', opts)

-- Deletes the current cell
vim.keymap.set('n', '<leader>jcd', '<cmd>call jukit#cells#delete()<CR>', opts)

-- Send current section (argument: 0 indicates the current section)
vim.keymap.set('n', '<leader>jcc', '<cmd>call jukit#send#section(0)<CR>', opts)

-- Send all sections up to the current section
vim.keymap.set('n', '<leader>jcac', '<cmd>call jukit#send#until_current_section()<CR>', opts)

-- Send all sections
vim.keymap.set('n', '<leader>jca', '<cmd>call jukit#send#all()<CR>', opts)

-- Open an output split
vim.keymap.set('n', '<leader>jos', '<cmd>call jukit#splits#output()<CR>', opts)
