require("gianmarcoricciarelli")

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

require("lazy").setup({
	{ import = "plugins" },
	{ import = "colorschemes" },
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
		init = function()
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},
	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			local lsp_zero = require("lsp-zero")

			lsp_zero.extend_lspconfig()
			lsp_zero.on_attach(function(client, bufnr)
				vim.keymap.set(
					"n",
					"<leader>gd",
					"<cmd>lua vim.lsp.buf.definition()<cr>",
					{ desc = "LSP: Go to Definition" }
				)
				vim.keymap.set(
					"n",
					"<leader>gD",
					"<cmd>lua vim.lsp.buf.declaration()<cr>",
					{ desc = "LSP: Go to Declariation" }
				)
				vim.keymap.set(
					"n",
					"<leader>go",
					"<cmd>lua vim.lsp.buf.type_definition()<cr>",
					{ desc = "LSP: Go to Type's Definition" }
				)
				vim.keymap.set(
					"n",
					"<leader>si",
					"<cmd>lua vim.lsp.buf.hover()<cr>",
					{ desc = "LSP: Display Symbol's Infors" }
				)
			end)

			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"cssls",
					"tailwindcss",
					"html",
					"tsserver",
					"eslint",
					"rust_analyzer",
					"taplo",
					"volar",
					"jsonls",
					"gopls",
				},
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function()
						local lua_opts = lsp_zero.nvim_lua_ls()
						require("lspconfig").lua_ls.setup(lua_opts)
					end,
				},
			})
		end,
	},
	{ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			local lsp_zero = require("lsp-zero")
			local cmp = require("cmp")
			local cmp_format = require("lsp-zero").cmp_format()
			lsp_zero.extend_cmp()
			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<Tab>"] = cmp.mapping.confirm(),
					["<CR>"] = cmp.mapping.confirm(),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},
				formatting = cmp_format,
			})
		end,
	},
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "saadparwaiz1/cmp_luasnip" },
	{
		"rafamadriz/friendly-snippets",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					fish = { "fish_indent" },
					css = { "prettier" },
					scss = { "prettier" },
					html = { "prettier" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					vue = { "prettier" },
					json = { "prettier" },
					jsonc = { "prettier" },
				},
				format_on_save = {
					timeout_ms = 3000,
					lsp_fallback = false,
				},
			})
		end,
	},
})
