local status = pcall(require, "vim-test")
if (not status) then return end

local keymap = vim.keymap

keymap.set('n', '<leader>T', ':TestFile<CR>');
keymap.set('n', '<leader>t', ':TestNearest<CR>');
keymap.set('n', '<leader>ta', ':TestSuite<CR>');
keymap.set('n', '<leader>tl', ':TestLast<CR>');
keymap.set('n', '<leader>tv', ':TestVisit<CR>');
