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

-- Quickfix
vim.keymap.set("n", "<C-h>", "<cmd>cclose<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Alternate Files
vim.keymap.set("n", "<leader>1", "<cmd>AV<CR>")

-- Misc
vim.keymap.set("n", "<leader>0", "<cmd>CellularAutomaton make_it_rain<CR>")
