local M = {}

M.change_theme = function(scheme)
    vim.cmd('colorscheme ' .. scheme)
end

return M

