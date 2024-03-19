require("conform").setup({
	formatters_by_ft = {
		python = { "black" },
		javascript = { "prettierd" },
		markdown = { "mdformat" },
        json = {"jq"}
	},
	format_on_save = {
		lsp_fallback = true,
	},
})
