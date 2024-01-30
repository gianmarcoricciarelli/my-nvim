return {
	"crusj/bookmarks.nvim",
	branch = "main",
	dependencies = { "nvim-web-devicons" },
	config = function()
		require("bookmarks").setup({
			keymap = {
				toggle = "<C-b>",
				add = "<C-z>",
			},
		})
		require("telescope").load_extension("bookmarks")
	end,
}
