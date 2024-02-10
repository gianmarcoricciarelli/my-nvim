local map = vim.keymap.set

vim.g.mapleader = " "

map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save File" })
map("n", "<leader>pm", "<cmd>Lazy<cr>", { desc = "Open Lazy Plugin Manager" })
map("n", "<C-d>", "<cmd>bdelete<cr>", { desc = "Delete current Buffer" })
map("n", "<C-n>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<C-p>", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
