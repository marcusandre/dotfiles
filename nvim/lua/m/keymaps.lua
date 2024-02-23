local utils = require('m.utils')

-- General
vim.keymap.set('i', 'kj', '<Esc><Cmd>silent! update | redraw<CR>', { desc = 'Exit input mode' })
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
