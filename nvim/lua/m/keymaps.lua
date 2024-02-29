local utils = require('m.utils')

-- General
vim.keymap.set('i', 'kj', '<Esc><Cmd>silent! update | redraw<CR>', { desc = 'Exit input mode' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader><leader>', '<Cmd>:b#<CR>', { desc = 'Alternate Buffer' })
vim.keymap.set('n', 'n', 'nzz')

-- Copy/paste with system clipboard
vim.keymap.set({ 'n', 'x' }, 'gy', '"+y', { desc = 'Copy to system clipboard' })
vim.keymap.set('n', 'gp', '"+p', { desc = 'Paste from system clipboard' })

-- Quickfix
vim.keymap.set('n', '<leader>c', utils.toggle_quickfix, { desc = 'Quickfix' })

-- Other
vim.keymap.set('n', '<leader>ol', '<Cmd>Lazy<CR>', { desc = 'Lazy' })
vim.keymap.set('n', '<leader>om', '<Cmd>Mason<CR>', { desc = 'Mason' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Panes
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
