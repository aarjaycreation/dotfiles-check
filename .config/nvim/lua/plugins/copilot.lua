require("copilot").setup({
    suggestion = {enabled = false},
    panel = {enabled = false},
    filetypes = {
        yaml = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = true
    }
})
