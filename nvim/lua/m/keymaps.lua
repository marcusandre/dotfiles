vim.keymap.set("n", "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
-- vim.keymap.set('n', '<leader><space>', '<cmd>bp<cr>', { desc = 'Buffer previous' })
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "n", "nzz")

vim.keymap.set("n", "<leader>z", "<Cmd>wq<cr>", { desc = "Save and Quit" })

vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
