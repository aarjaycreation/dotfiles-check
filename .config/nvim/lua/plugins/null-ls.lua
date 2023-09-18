local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.stylish_haskell,
        null_ls.builtins.formatting.fourmolu,
        null_ls.builtins.formatting.blue,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.sql_formatter.with({
            extra_args = { "--config", "/home/afonso/.config/nvim/lua/plugins/sql_formatter.json"}
        }),
        null_ls.builtins.formatting.prettierd.with({
            filetypes = { "html", "json", "css", "js", "yaml", "markdown" },
        }),
    }
})
