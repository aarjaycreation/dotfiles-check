
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
  
	use {  "ggandor/leap.nvim",
	    	config = function ()
	    	    require('leap').add_default_mappings()
	    	end
	   }
	   
	use {  "neovim/nvim-lspconfig",
	    	config = function ()
	    	    require "plugins.lspconfig"
	    	end
	  }

	use {  "williamboman/mason.nvim",
	    	config = function ()
	    	    require "plugins.mason"
	    	end
	  }

	use {  "feline-nvim/feline.nvim" }

	use {"joshdick/onedark.vim" } 

	use {"nvim-tree/nvim-tree.lua",
	 	requires = {
		'nvim-tree/nvim-web-devicons',
		},
		config = function()
			require("nvim-tree").setup()
		end
         }

	use {"nvim-treesitter/nvim-treesitter",
		config = function()
			require "plugins.treesitter"
		end
	 }

	use {'akinsho/bufferline.nvim',
		tag = "v3.*",
		requires = 'kyazdani42/nvim-web-devicons',
		config = function ()
			require("bufferline").setup{}
		end
	}

	use {"windwp/nvim-autopairs",
   		config = function() require("nvim-autopairs").setup {} end
	}

	use {"neoclide/coc.nvim",
		config = function() require("plugins.nvim-coc") end
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
