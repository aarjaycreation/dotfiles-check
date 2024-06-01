return {
    -- Rename variable pop up
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
    },
    {
        "williamboman/mason.nvim",
        event = "VeryLazy",
        config = function()
            local mason = require("mason")
            vim.api.nvim_create_augroup("_mason", { clear = true })
            local options = {
                PATH = "skip",
                ui = {
                    icons = {
                        package_pending = " ",
                        package_installed = "󰄳 ",
                        package_uninstalled = " ",
                    },
                    keymaps = {
                        toggle_server_expand = "<CR>",
                        install_server = "i",
                        update_server = "u",
                        check_server_version = "c",
                        update_all_servers = "U",
                        check_outdated_servers = "C",
                        uninstall_server = "X",
                        cancel_installation = "<C-c>",
                    },
                },
                max_concurrent_installers = 10,
            }
            mason.setup(options)
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim"
        },
        config = function()
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
                                language = "pt-PT",
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
        end
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "williamboman/mason-lspconfig.nvim"
        },
        config = function()
            local lspconfig = require("lspconfig")

            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    local fzflua = require("fzf-lua")
                    local conform = require("conform")

                    local client = vim.lsp.get_client_by_id(ev.data.client_id)
                    if client ~= nil then
                        client.server_capabilities.semanticTokensProvider = nil
                    end

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
        end,
    },
    {
        "stevearc/conform.nvim",
        event = "VeryLazy",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    python = { "black" },
                    haskell = { "fourmolu" },
                    javascript = { "prettierd" },
                    markdown = { "mdformat" },
                    go = { "gofmt" },
                    json = { "jq" }
                }
            })
        end,
    },

    {
        "lervag/vimtex",
        event = "VeryLazy",
        config = function()
            vim.g.vimtex_view_method = 'skim'
            vim.g.vimtex_compiler_methor = 'pdflatex'
        end,
    },
    {
        "barreiroleo/ltex-extra.nvim",
        event = "VeryLazy",
    },
}
