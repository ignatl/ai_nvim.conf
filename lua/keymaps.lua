vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uick fix list" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "To the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "To the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "To the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "To the upper window" })

