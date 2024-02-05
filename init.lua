require("keymaps")

-- INTERFACE
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.termguicolors = true

-- TABS AND INDENTATION
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- BACKUPS FILES
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = false

-- SEARCH
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- MISCELLANEOUS
vim.opt.scrolloff = 8
vim.opt.updatetime = 50

-- LAZY PLUGIN MANAGER
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({ { import = "plugins" }, { import = "colorschemes" }, { import = "lsp"} })
