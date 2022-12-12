
local packer = require("packer")

local plugins = packer.startup({function(use)

	use {
		"wbthomason/packer.nvim",
		config = [[require("plugins.packer")]]
	}

	use{  "lewis6991/impatient.nvim"}


	use{  "lervag/vimtex",
		config = function ()
			require "plugins.vimtex"
		end
	}

	-------------------------------------------------------QOL----------------------------------------------

	use {  "ggandor/leap.nvim",
		config = function ()
			require('leap').add_default_mappings()
		end
	}

	use {'stevearc/dressing.nvim'} -- Rename variable pop up 

	use {"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} 
		end
	}
	-------------------------------------------------------LSP----------------------------------------------

	use {  "williamboman/mason.nvim",
		config = function ()
			require "plugins.mason"
		end
	}

	use {"williamboman/mason-lspconfig.nvim"}

	use {  "neovim/nvim-lspconfig",
		config = function ()
			require "plugins.lspconfig"
		end
	}

	use { "L3MON4D3/LuaSnip",
		requires = {
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip"
		},
	}
	--------------------------------------------------SUGGESTION BOX-----------------------------------------
	use { "hrsh7th/nvim-cmp",
		requires = {
			'hrsh7th/cmp-nvim-lsp', -- lsp
			'hrsh7th/cmp-buffer', --buffer completions
			'hrsh7th/cmp-path', --path completions
			'hrsh7th/cmp-cmdline' --cmdline completions
		},
		config = function()
			require "plugins.cmp"
		end
	}

	---	use {"ms-jpq/coq_nvim",
	---		branch = 'coq',
	---		config = function ()
	---			vim.g.coq_settings = { auto_start = 'shut-up'}
	---		end
	---
	---	}
	---
	--	use {"ms-jpq/coq_nvim",
	--		branch = 'artifacts',
	--	}
	-------------------------------------------------------------------------------------------





	use {'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		config = function()
			require("nvim-tree").setup()
		end
	}
	use {  "feline-nvim/feline.nvim" }

	use {"joshdick/onedark.vim" } 

	use {"nvim-treesitter/nvim-treesitter",
		config = function()
			require "plugins.treesitter"
		end
	}

	--Tabs
	use {'romgrk/barbar.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function ()
			require "plugins.barbar"
		end
	}

	--fuzzy file finding
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} },
		config = function() require('plugins.telescope') end
	}
	--live share like functionality
	use {"jbyuki/instant.nvim"}

	use {"narutoxy/silicon.lua",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require('silicon').setup({
				font = "FiraCode Nerd Font Mono",
				output = "~/Pictures/SILICON_${year}-${month}-${date}.png",
				debug = true
			})
			require "plugins.silicon"
		end
	}

	use {"tpope/vim-surround"}

	use {"startup-nvim/startup.nvim",
		requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
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
