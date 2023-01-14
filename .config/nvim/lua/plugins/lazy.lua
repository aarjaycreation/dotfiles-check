local lazy = require('lazy')

lazy.setup({

    'lewis6991/impatient.nvim',

    -------------------------------------------THEMES------------------------------------------
    'joshdick/onedark.vim',
    { 'catppuccin/nvim',
        lazy = false,
        priority = 1000,
        config = function ()
            require('plugins.catppuccin')
        end
    },
    -------------------------------------------------------QOL---------------------------------
    --better navigation with 's-letter'
    { 'ggandor/leap.nvim',
        config = function()
            require('leap').add_default_mappings()
        end
    },

    --Change add and remove surroundings from words
    'tpope/vim-surround',

    -- Rename variable pop up
    'stevearc/dressing.nvim',

    { 'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {}
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
    { 'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp', -- lsp
            'hrsh7th/cmp-nvim-lua', -- Nvim API completions
            'hrsh7th/cmp-nvim-lsp-signature-help', -- Show function signatures
            'hrsh7th/cmp-buffer', --buffer completions
            'hrsh7th/cmp-path', --path completions
            'hrsh7th/cmp-cmdline', --cmdline completions
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            require 'plugins.cmp'
        end
    },

    --LSP Status
    { 'j-hui/fidget.nvim',
        config = function()
            require('fidget').setup {}
        end
    },

    { 'williamboman/mason.nvim',
        config = function()
            require 'plugins.mason'
        end
    },

    'williamboman/mason-lspconfig.nvim',

    { 'neovim/nvim-lspconfig',
        config = function()
            require 'plugins.lspconfig'
        end
    },

    { 'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require 'plugins.null-ls'
        end
    },

    { 'lervag/vimtex',
        config = function()
            require 'plugins.vimtex'
        end
    },
    -------------------------------------------------------------------------------------------
    -- Syntax Highlighting
    { 'nvim-treesitter/nvim-treesitter',
        config = function()
            require 'plugins.treesitter'
        end
    },

    --Sticky headers
    { 'nvim-treesitter/nvim-treesitter-context',
        config = function()
            require 'plugins.treesitter-context'
        end
    },

    --Tabs
    { 'akinsho/bufferline.nvim',
        version = 'v3.*',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("plugins.bufferline")
        end
    },
    --{ 'romgrk/barbar.nvim',
    --    dependencies = 'nvim-tree/nvim-web-devicons',
    --    config = function()
    --        require 'plugins.barbar'
    --    end
    --},

    --does so much
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function() require('plugins.telescope') end
    },


    --Main menu
    { 'startup-nvim/startup.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
        config = function()
            require('startup').setup { theme = 'dashboard' }
        end,
    },

})
