local packer = require("packer")

local plugins = packer.startup({ function(use)

	use {
		"wbthomason/packer.nvim",
		config = [[require("plugins.packer")]]
	}

	use { "lewis6991/impatient.nvim" }


	use { "lervag/vimtex",
		config = function()
			require "plugins.vimtex"
		end
	}

	-------------------------------------------------------QOL----------------------------------------------

	use { "ggandor/leap.nvim",
		config = function()
			require('leap').add_default_mappings()
		end
	}

	use { "stevearc/dressing.nvim" } -- Rename variable pop up

	use { "windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {}
		end
	}

	use { "kyazdani42/nvim-web-devicons" }

	use {
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require 'plugins.lualine'
		end
	}

    use {"j-hui/fidget.nvim",
        config = function ()
            require("fidget").setup{}
        end
    }

	use {"voldikss/vim-floaterm"}

	--------------------------------------------------SUGGESTION BOX-----------------------------------------
	use { "hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp", -- lsp
			"hrsh7th/cmp-buffer", --buffer completions
			"hrsh7th/cmp-path", --path completions
			"hrsh7th/cmp-cmdline" --cmdline completions
		},
		config = function()
			require "plugins.cmp"
		end
	}
	-------------------------------------------------------LSP----------------------------------------------
	
	use { "williamboman/mason.nvim",
		config = function()
			require "plugins.mason"
		end
	}

	use { "williamboman/mason-lspconfig.nvim" }

	use { "hrsh7th/cmp-nvim-lsp"}

	use { "neovim/nvim-lspconfig",
		config = function()
			require "plugins.lspconfig"
		end
	}

	use { "jose-elias-alvarez/null-ls.nvim",
		config = function()
			require "plugins.null-ls"
		end
	}

	use { "L3MON4D3/LuaSnip",
		requires = {
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip"
		},
	}

	------------------------------------------------------------------------------------------

	use { "nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		config = function()
			require("nvim-tree").setup()
		end
	}
	use { "feline-nvim/feline.nvim" }
	-------------------------------------------THEMES------------------------------------------

	use { "joshdick/onedark.vim" }
	use { "catppuccin/nvim" }
	-------------------------------------------------------------------------------------------
	use { "nvim-treesitter/nvim-treesitter",
		config = function()
			require "plugins.treesitter"
		end
	}

	use { "nvim-treesitter/nvim-treesitter-context",
		config = function()
			require "plugins.treesitter-context"
		end
	}

	--Tabs
	use { "romgrk/barbar.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require "plugins.barbar"
		end
	}

	--fuzzy file finding
	use {
		"nvim-telescope/telescope.nvim", tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function() require('plugins.telescope') end
	}

	use { "tpope/vim-surround" }

	use { "startup-nvim/startup.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("startup").setup { theme = "dashboard" }
		end,
	}

end,

	config = {
		auto_clean = true,
		compile_on_sync = true,
		git = { clone_timeout = 6000 },
		display = {
			working_sym = "ﲊ",
			error_sym = "✗ ",
			done_sym = " ",
			removed_sym = " ",
			moved_sym = "",
		},
	}
})
