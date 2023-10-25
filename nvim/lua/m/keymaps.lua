local fns = require("m.functions")

vim.keymap.set("n", "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
vim.keymap.set("n", "<leader>bs", fns.make_scratch_buffer, { desc = "Scratch" })
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "n", "nzz")

vim.keymap.set("i", "kj", "<esc>")

vim.keymap.set("n", "<leader>oc", fns.toggle_quickfix, { desc = "Quickfix: Toggle" })
vim.keymap.set("n", "<leader>ol", "<Cmd>Lazy<CR>", { desc = "Lazy" })
vim.keymap.set("n", "<leader>om", "<Cmd>Mason<CR>", { desc = "Mason" })
vim.keymap.set("n", "<leader>oo", "<Cmd>only<CR>", { desc = "Window: Only" })
