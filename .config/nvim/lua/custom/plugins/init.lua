return {
  ["lervag/vimtex"]= {
    config = function ()
      require "custom.plugins.vimtex"
    end
  },

  ["L3MON4D3/LuaSnip"] = {
    config = function()
         require("plugins.configs.others").luasnip()
         require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.luasnippets_path })
      end
  },
  ["ggandor/leap.nvim"] = {
    config = function ()
        require('leap').add_default_mappings()
    end
  },
  ["neovim/nvim-lspconfig"] = {
    config = function ()
      require("core.lazy_load").on_file_open "nvim-lspconfig"
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end
  }

}
