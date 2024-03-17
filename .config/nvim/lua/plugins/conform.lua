require("conform").setup({
	formatters_by_ft = {
		python = { "black" },
		javascript = { "prettierd" },
		markdown = { "mdformat" },
	},
	format_on_save = {
		lsp_fallback = true,
	},
})
