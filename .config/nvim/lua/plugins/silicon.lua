local present, silicon = pcall(require,'silicon')

-- Generate image of lines in a visual selection
vim.keymap.set('v', '<Leader>s',  function() silicon.visualise_api() end )
-- Generate image of a whole buffer, with lines in a visual selection highlighted
vim.keymap.set('v', '<Leader>bs', function() silicon.visualise_api({to_clip = true, show_buf = true}) end )
