local keymap = vim.keymap

vim.g.mapleader = " "

-- Movement
keymap.set('n', 'j', 'gj');
keymap.set('n', 'k', 'gk');
keymap.set('i', 'kj', '<ESC>');
keymap.set('i', 'jk', '<ESC>');

-- Search
keymap.set("n", "<bs>", "<cmd>nohl<CR>")
keymap.set("n", "<C-l>", "<cmd>nohl<CR>")

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
keymap.set("n", "<C-h>", "<cmd>cclose<CR>")
keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Alternate Files
keymap.set("n", "<leader>1", "<cmd>AV<CR>")

-- Misc
keymap.set("n", "<leader>0", "<cmd>CellularAutomaton make_it_rain<CR>")
