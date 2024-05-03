local utils = require('m.utils')
local map = utils.map

-- General
map('i', 'kj', '<Esc><Cmd>silent! update | redraw<CR>', { desc = 'Exit input mode' })
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', '<leader><leader>', '<Cmd>:b#<CR>', { desc = 'Alternate Buffer' })
map('n', 'n', 'nzz')

-- Stay in indent mode
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Copy/paste with system clipboard
map({ 'n', 'x' }, 'gy', '"+y', { desc = 'Copy to system clipboard' })
map('n', 'gp', '"+p', { desc = 'Paste from system clipboard' })

-- Quickfix
map('n', '<leader>c', utils.toggle_quickfix, { desc = 'Quickfix' })

-- Toggles
map('n', '\\w', '<Cmd>setlocal wrap! wrap?<CR>', { desc = 'Toggle: Wrap' })
map('n', '\\i', utils.toggle_inlay_hints, { desc = 'Toggle: Wrap' })

-- Other
map('n', '<leader>ol', '<Cmd>Lazy<CR>', { desc = 'Lazy' })
map('n', '<leader>om', '<Cmd>Mason<CR>', { desc = 'Mason' })

-- Terminal
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
map('n', '<leader>tt', '<Cmd>vertical terminal<CR>', { desc = 'Open terminal to the right' })

-- Panes
map('n', '<C-l>', '<cmd>nohlsearch<CR>', { desc = 'Clear search higlighting' })
