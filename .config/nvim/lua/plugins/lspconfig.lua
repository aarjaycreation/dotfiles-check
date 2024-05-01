local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason_lspconfig.setup({
    automatic_installation = false,
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        vim.opt_local.signcolumn = numbers

        local telescope = require("telescope.builtin")
        local conform = require("conform")

        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        client.server_capabilities.semanticTokensProvider = nil

        --Enable inlay hints
        --vim.lsp.inlay_hint.enable(ev.buf,true)

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap = true, silent = true, buffer = ev.buf }
        vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, bufopts)
        vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, bufopts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gd", telescope.lsp_definitions, bufopts)
        vim.keymap.set("n", "gr", telescope.lsp_references, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gi", telescope.lsp_implementations, bufopts)
        vim.keymap.set("n", "<space>k", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "<space>ge", function() vim.diagnostic.goto_next() end, bufopts)
        vim.keymap.set("n", "<space>gE", function() vim.diagnostic.goto_prev() end, bufopts)
        vim.keymap.set("n", "<space>fo", function() conform.format({ lsp_fallback = true }) end, bufopts)
        vim.keymap.set("n", "<space>n", "<cmd>!toke check<cr>")
    end,
})

-- ADD NVIM CMP AS A CAPABILITY
local lsp_defaults = lspconfig.util.default_config
local capabilities =
    vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

mason_lspconfig.setup_handlers({
    -- This is a default handler that will be called for each installed server (also for new servers that are installed during a session)
    function(server_name)
        lspconfig[server_name].setup({
            capabilities = capabilities,
        })
    end,
    ["gopls"] = function()
        lspconfig["gopls"].setup({
            capabilities = capabilities,
            settings = {
                gopls = {
                    ["ui.completion.usePlaceholders"] = true,
                    ["ui.diagnostic.staticcheck"] = true,
                    ["ui.inlayhint.hints"] = {
                        assignVariablesTypes = true,
                        compositeLiteralFields = true,
                        compositeLiteralTypes = true,
                        constantValues = true,
                        functionTypeParameters = true,
                        parameterNames = true,
                        rangeVariableTypes = true
                    },
                }
            }
        })
    end,
    ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { "vim" },
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    hint = { enable = true }
                },
            },
        })
    end,
    ["ltex"] = function()
        lspconfig["ltex"].setup({
            capabilities = capabilities,
            --Local on attach
            on_attach = function(_, _)
                -- rest of your on_attach process.
                require("ltex_extra").setup()
            end,
            settings = {
                ltex = {
                    language = "en-US",
                },
            },
        })
    end,
    ["basedpyright"] = function()
        lspconfig["basedpyright"].setup({
            capabilities = capabilities,
            settings = {
                verboseOutput = true,
                autoImportCompletion = true,
                basedpyright = {
                    analysis = {
                        typeCheckingMode = "all",
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                        diagnosticMode = "openFilesOnly",
                        indexing = true,
                    },
                },
            },
        })
    end,
})


lspconfig["hls"].setup({
    capabilities = capabilities,
    filetypes = { 'haskell', 'lhaskell', 'cabal' },
})




--vim.g.rustaceanvim = {
--    server = {
--        capabilities = capabilities,
--    },
--}
