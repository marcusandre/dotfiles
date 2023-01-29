local keymap = vim.keymap

vim.g.mapleader = " "

-- Movement
keymap.set('n', 'j', 'gj');
keymap.set('n', 'k', 'gk');
keymap.set('i', 'kj', '<ESC>');
keymap.set('i', 'jk', '<ESC>');

-- Search
vim.keymap.set("n", "<bs>", "<cmd>nohl<CR>")

-- Tabs
keymap.set('n', ']t', ':tabn<cr>')
keymap.set('n', '[t', ':tabp<cr>')

-- Buffers
keymap.set("n", "Q", "<nop>")
keymap.set("n", "Q", "<cmd>%bd!<CR>")
keymap.set("n", "<leader>q", "<cmd>bd!<CR>")
keymap.set('n', '<leader><leader>', ':b#<CR>')
keymap.set('n', ']b', ':bnext<cr>')
keymap.set('n', '[b', ':bprev<cr>')

-- Lists
vim.keymap.set("n", "<C-q>", "<cmd>cclose<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Alternate Files
vim.keymap.set("n", "KK", "<cmd>AV<CR>")
