local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason_lspconfig.setup({
    automatic_installation = false,
})

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
