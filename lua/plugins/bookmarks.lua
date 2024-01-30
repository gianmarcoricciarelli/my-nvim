return {
	"crusj/bookmarks.nvim",
	branch = "main",
	dependencies = { "nvim-web-devicons" },
	config = function()
		require("bookmarks").setup()
		require("telescope").load_extension("bookmarks")
	end,
}
