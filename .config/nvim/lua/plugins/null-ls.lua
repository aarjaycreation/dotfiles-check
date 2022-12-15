local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.prettierd.with({
			filetypes = { "html", "json", "yaml", "markdown" },
		}),
	}
})
