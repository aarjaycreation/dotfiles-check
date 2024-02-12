local lazy = require('lazy')

lazy.setup({

    'lewis6991/impatient.nvim',

    -------------------------------------------THEMES------------------------------------------
    {
        'zaldih/themery.nvim',
        config = function()
            require('plugins.themery')
        end
    },
    {
        'catppuccin/nvim',
        name = "catppuccin",
        lazy = false,
        priority = 1000,
    },

    { "ellisonleao/gruvbox.nvim", priority = 1000 },

    'rose-pine/neovim',
    -------------------------------------------------------MFP---------------------------------
    {
        'susliko/tla.nvim',
        config = function()
            require("tla").setup()
        end
    },
    -------------------------------------------------------QOL---------------------------------

    {
        'chipsenkbeil/distant.nvim',
        branch = 'v0.3',
        config = function()
            require('distant'):setup({
                servers = {
                    ['10.8.0.9'] = {
                        launch = {
                            default = {
                                username = 'afonso',
                                args = '--port 8080 --shutdown lonely=1'
                            }
                        }
                    },
                }
            })
        end
    },
    --Python notebooks
    {
        'luk400/vim-jukit',
        config = function()
            require 'plugins.jukit'
        end
    },
    --org mode
    {
        'nvim-orgmode/orgmode',
        dependencies = {
            { 'nvim-treesitter/nvim-treesitter', lazy = true },
        },
        event = 'VeryLazy',
        config = function()
            -- Load treesitter grammar for org
            require('orgmode').setup_ts_grammar()

            -- Setup orgmode
            require('orgmode').setup({
                org_agenda_files = '~/orgfiles/**/*',
                org_default_notes_file = '~/orgfiles/refile.org',
            })
        end,
    },

    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require 'plugins.copilot'
        end,
    },
    --better navigation with 's-letter'
    {
        'ggandor/leap.nvim',
        event = "VeryLazy",
        config = function()
            require('leap').add_default_mappings()
        end
    },

    --Nvim to browser
    'subnut/nvim-ghost.nvim',

    {
        '2kabhishek/nerdy.nvim',
        event = "VeryLazy",
        dependencies = {
            'stevearc/dressing.nvim',
            'nvim-telescope/telescope.nvim',
        },
        cmd = 'Nerdy',
    },

    {
        'declancm/cinnamon.nvim',
        config = function()
            require('cinnamon').setup {
                scroll_limit = 10000,
                always_scroll = true,
            }
        end
    },

    {

        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },

    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup {}
        end
    },

    {
        'folke/zen-mode.nvim',
        event = "VeryLazy",
        config = function()
            require("zen-mode").setup {
                vim.keymap.set('n', '<leader>z', '<Cmd> ZenMode <CR>', { noremap = true, silent = true })
            }
        end
    },

    --Change add and remove surroundings from words
    'tpope/vim-surround',

    {
        'NvChad/nvim-colorizer.lua',
        config = function()
            require 'colorizer'.setup()
        end
    },

    -- {
    --     "roobert/tailwindcss-colorizer-cmp.nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         require("tailwindcss-colorizer-cmp").setup({
    --             color_square_width = 2,
    --         })
    --     end
    -- },
    -- {
    --     'laytan/tailwind-sorter.nvim',
    --     event = "VeryLazy",
    --     dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
    --     build = 'cd formatter && bun i && bun run build',
    --     config = true,
    -- },
    --Database integration
    -- 'tpope/vim-dadbod',
    -- {
    --     'kristijanhusak/vim-dadbod-ui',
    --     config = function()
    --         vim.g.db_ui_auto_execute_table_helpers = 1
    --     end
    -- },
    -- 'kristijanhusak/vim-dadbod-completion',

    'mbbill/undotree',

    --Tmux navigation
    {
        'alexghergh/nvim-tmux-navigation',
        config = function()
            require 'nvim-tmux-navigation'.setup {
                disable_when_zoomed = true, -- defaults to false
                keybindings = {
                    left = "<F5>",
                    down = "<F6>",
                    up = "<F7>",
                    right = "<F8>",
                }
            }
        end
    },

    -- Rename variable pop up
    'stevearc/dressing.nvim',

    -- {
    --     'krady21/compiler-explorer.nvim',
    --     event = "VeryLazy",
    --     config = function()
    --         require("compiler-explorer").setup({
    --             url = "https://godbolt.org",
    --             infer_lang = true,      -- Try to infer possible language based on file extension.
    --             line_match = {
    --                 highlight = true,   -- highlight the matching line(s) in the other buffer.
    --                 jump = true,        -- move the cursor in the other buffer to the first matching line.
    --             },
    --             open_qflist = true,     --  Open qflist after compilation if there are diagnostics.
    --             split = "split",        -- How to split the window after the second compile (split/vsplit).
    --             compiler_flags = "",    -- Default flags passed to the compiler.
    --             job_timeout_ms = 25000, -- Timeout for libuv job in milliseconds.
    --             languages = {           -- Language specific default compiler/flags
    --                 c = {
    --                     compiler = "cg132"
    --                 }
    --             },
    --         })
    --     end
    -- },

    {
        'windwp/nvim-autopairs',
        config = function()
            require 'plugins.autopairs'
        end
    },

    'nvim-tree/nvim-web-devicons',

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require 'plugins.lualine'
        end
    },

    {
        'stevearc/oil.nvim',
        config = function()
            require("oil").setup()
        end
    },

    -------------------------------------------------------LSP----------------------------------------------
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',                -- lsp
            'hrsh7th/cmp-nvim-lua',                -- Nvim API completions
            'hrsh7th/cmp-nvim-lsp-signature-help', -- Show function signatures
            'hrsh7th/cmp-buffer',                  --buffer completions
            'hrsh7th/cmp-path',                    --path completions
            'hrsh7th/cmp-cmdline',                 --cmdline completions
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            require 'plugins.cmp'
        end
    },

    --LSP Status
    'j-hui/fidget.nvim',

    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {}
        },
    },
    {
        "mfussenegger/nvim-dap",
    },

    {
        'williamboman/mason.nvim',
        config = function()
            require 'plugins.mason'
        end
    },

    'williamboman/mason-lspconfig.nvim',

    {
        'neovim/nvim-lspconfig',
        config = function()
            require 'plugins.lspconfig'
        end
    },

    {
        'nvimtools/none-ls.nvim',
        event = "VeryLazy",
        config = function()
            require 'plugins.none-ls'
        end
    },

    {
        'lervag/vimtex',
        event = "VeryLazy",
        config = function()
            require 'plugins.vimtex'
        end
    },

    -------------------------------------------------------------------------------------------
    -- Syntax Highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require 'plugins.treesitter'
        end
    },

    'kaarmu/typst.vim',

    --Sticky headers
    {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
            require 'plugins.treesitter-context'
        end
    },

    "runoshun/vim-alloy",

    --Tabs
    {
        'akinsho/bufferline.nvim',
        version = 'v3.*',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("plugins.bufferline")
        end
    },

    --does so much
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function() require('plugins.telescope') end
    },


    --Main menu
    -- {
    --     'startup-nvim/startup.nvim',
    --     dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    --     config = function()
    --         require('startup').setup { theme = 'dashboard' }
    --     end,
    -- },

    -------------------------------------------OTHERS----------------------------------------------

    -- {
    --     "nvim-neorg/neorg",
    --     build = ":Neorg sync-parsers",
    --     config = function()
    --         require("neorg").setup {
    --             load = {
    --                 ["core.defaults"] = {}, -- Loads default behaviour
    --                 ["core.concealer"] = {} -- Adds pretty icons to your documents
    --             },
    --         }
    --     end,
    --     dependencies = { "nvim-lua/plenary.nvim" },
    -- },

    -- 'kmonad/kmonad-vim',
    -- 'elkowar/yuck.vim',
    --Discord Rich Presence
    'andweeb/presence.nvim'

})
