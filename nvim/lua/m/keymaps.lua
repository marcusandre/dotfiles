local utils = require('m.utils')
local map = vim.keymap.set

-- General
map('i', 'kj', '<Esc>', { desc = 'Leave input mode' })
map('n', '<Esc>', '<Cmd>nohl<CR><Esc>', { desc = 'Remove highlights' })
map('n', '<leader><leader>', '<Cmd>:b#<CR>', { desc = 'Alternate Buffer' })
map('n', '<leader>bq', '<Cmd>:%bd|e#<CR>', { desc = 'Delete (all)' })
map('n', 'Q', '<nop>')
map('n', 'n', 'nzz')

-- Move by visible lines. Notes:
map({ 'n', 'x' }, 'j', [[v:count == 0 ? 'gj' : 'j']], { expr = true })
map({ 'n', 'x' }, 'k', [[v:count == 0 ? 'gk' : 'k']], { expr = true })

-- Copy/paste with system clipboard
map({ 'n', 'x' }, 'gy', '"+y', { desc = 'Copy to system clipboard' })
map('n', 'gp', '"+p', { desc = 'Paste from system clipboard' })

-- Alternative way to save and exit in Normal mode.
map('n', '<C-S>', '<Cmd>silent! update | redraw<CR>', { desc = 'Save' })
map({ 'i', 'x' }, '<C-S>', '<Esc><Cmd>silent! update | redraw<CR>', { desc = 'Save and go to Normal mode' })
map('i', 'kj', '<Esc><Cmd>silent! update | redraw<CR>', { desc = 'Exit input mode' })

-- Window navigation
map('n', '<C-H>', '<C-w>h', { desc = 'Focus on left window' })
map('n', '<C-J>', '<C-w>j', { desc = 'Focus on below window' })
map('n', '<C-K>', '<C-w>k', { desc = 'Focus on above window' })
map('n', '<C-L>', '<C-w>l', { desc = 'Focus on right window' })

-- Quickfix
map('n', '<leader>c', utils.toggle_quickfix, { desc = 'Quickfix' })

-- Other
map('n', '<leader>ol', '<Cmd>Lazy<CR>', { desc = 'Lazy' })
map('n', '<leader>om', '<Cmd>Mason<CR>', { desc = 'Mason' })
map('n', '<leader>oq', '<Cmd>qall<CR>', { desc = 'Leave editor' })
map('n', '<leader>ow', '<Cmd>wall<CR>', { desc = 'Write buffers' })
