local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')

npairs.setup({
    map_cr = true,
    map_bs = false,
    check_ts = true,
    enable_check_bracket_line = true,
    ignored_next_char = "[%w]"
})
