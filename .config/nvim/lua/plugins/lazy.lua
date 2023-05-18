local lazy = require('lazy')

lazy.setup({

    'lewis6991/impatient.nvim',

    -------------------------------------------THEMES------------------------------------------
    'joshdick/onedark.vim',
    {
        'catppuccin/nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('plugins.catppuccin')
        end
    },
    -------------------------------------------------------QOL---------------------------------
    --better navigation with 's-letter'
    {
        'ggandor/leap.nvim',
        config = function()
            require('leap').add_default_mappings()
        end
    },

    {
        'folke/zen-mode.nvim',
        config = function()
            require("zen-mode").setup {
                vim.keymap.set('n', '<leader>z', '<Cmd> ZenMode <CR>', { noremap = true, silent = true })
            }
        end
    },

    --Change add and remove surroundings from words
    'tpope/vim-surround',

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

    {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup {}
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
    {
        'j-hui/fidget.nvim',
        config = function()
            require('fidget').setup {
                window = {
                    blend = 0,
                }
            }
        end
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
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require 'plugins.null-ls'
        end
    },

    {
        'lervag/vimtex',
        config = function()
            require 'plugins.vimtex'
        end
    },

    { 'github/copilot.vim' },
    -------------------------------------------------------------------------------------------
    -- Syntax Highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require 'plugins.treesitter'
        end
    },

    --Sticky headers
    {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
            require 'plugins.treesitter-context'
        end
    },

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
        tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function() require('plugins.telescope') end
    },


    --Main menu
    {
        'startup-nvim/startup.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
        config = function()
            require('startup').setup { theme = 'dashboard' }
        end,
    },

    -------------------------------------------OTHERS----------------------------------------------

    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        opts = {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.concealer"] = {} -- Adds pretty icons to your documents
            },
        },
        dependencies = { { "nvim-lua/plenary.nvim" } },
    },

    'kmonad/kmonad-vim',
    'elkowar/yuck.vim',
    --Discord Rich Presence
    'andweeb/presence.nvim'

})
