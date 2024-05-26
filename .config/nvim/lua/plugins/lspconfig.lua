local lspconfig = require("lspconfig")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        vim.opt_local.signcolumn = numbers

        local fzflua = require("fzf-lua")
        local conform = require("conform")

        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        client.server_capabilities.semanticTokensProvider = nil

        -- Mappings.
        local bufopts = { noremap = true, silent = true, buffer = ev.buf }
        vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, bufopts)
        vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, bufopts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "gr", fzflua.lsp_references, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gi", fzflua.lsp_implementations, bufopts)
        vim.keymap.set("n", "<space>k", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "<space>ge", vim.diagnostic.goto_next, bufopts)
        vim.keymap.set("n", "<space>gE", vim.diagnostic.goto_prev, bufopts)
        vim.keymap.set("n", "<space>fo", function() conform.format({ lsp_fallback = true }) end, bufopts)
    end,
})

-- ADD NVIM CMP AS A CAPABILITY
local lsp_defaults = lspconfig.util.default_config
local capabilities =
    vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

lspconfig["hls"].setup({
    capabilities = capabilities,
    filetypes = { 'haskell', 'lhaskell', 'cabal' },
})
