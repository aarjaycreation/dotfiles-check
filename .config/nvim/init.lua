

local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	print("Downloading Packer ...")
	vim.fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
	vim.api.nvim_command("packadd packer.nvim")
	require("plugins.packer")
	require("packer").sync()
end

require('impatient')
require('plugins.theme')

Config = {
	theme="onedark",
	statusline = {
		minimal = false
	}
}

-- Mapping
require("mappings")
