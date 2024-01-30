return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opt = {
		them = "auto",
	},
	config = function()
		require("lualine").setup()
	end,
}
