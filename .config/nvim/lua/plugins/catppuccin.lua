
--local colorscheme = "onedark"

require("catppuccin").setup({
    flavour = "frappe", -- latte, frappe, macchiato, mocha
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
    },
    integrations = {
        cmp = true,
        nvimtree = true,
        telescope = true,
    },
})


local colorscheme = "catppuccin"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
