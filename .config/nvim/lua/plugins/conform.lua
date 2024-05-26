require("conform").setup({
	formatters_by_ft = {
		python = { "black" },
        haskell = { "fourmolu" },
		javascript = { "prettierd" },
		markdown = { "mdformat" },
        go = { "gofmt" },
        json = {"jq"}
	}
})
