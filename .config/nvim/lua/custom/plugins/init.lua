return {
  ["lervag/vimtex"]= {},

  ["L3MON4D3/LuaSnip"] = {
    config = function()
         require("plugins.configs.others").luasnip()
         require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.luasnippets_path })
      end
  }
}
