return {
	"tpope/vim-fugitive",
	config = function()
		local map = vim.keymap.set

		map("n", "<leader>gs", "<cmd>Git status<cr>", { desc = "Git Status" })
		map("n", "<leader>gc", "<cmd>Git commit --allow-empty-message<cr>", { desc = "Git commit with empty message" })
		map("n", "<leader>gap", "<cmd>Git add -p<cr>", { desc = "Git Add progressively" })
		map("n", "<leader>gall", "<cmd>Git add --all<cr>", { desc = "Git Add all" })
		map("n", "<leader>gp", "<cmd>Git push<cr>", { desc = "Git Push" })
	end,
}
