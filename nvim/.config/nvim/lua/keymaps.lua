local map = vim.keymap.set

-- Specify leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Move up/down by display lines when long lines wrap:
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- Stay in visual mode when indenting:
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Manage system clipboard
map('n', '<leader>cp', '"+p', { desc = 'paste from system clipboard' })
map('v', 'gy', '"+y', { desc = 'yank to system clipboard' })

-- Navigate buffers
map('n', '[b', ':bp<CR>', { desc = 'previous buffer' })
map('n', ']b', ':bn<CR>', { desc = 'next buffer' })

-- Manage buffers
map("n", "<leader>ba", "<Cmd>b#<CR>", { desc = "Alternate" })
map("n", "<leader>bd", "<Cmd>lua MiniBufremove.delete()<CR>", { desc = "Delete" })
map("n", "<leader>bo", "<Cmd>%bd|e#|bd#<CR>", { desc = "Delete Other Buffers" })

map("n", "<leader>sr", ":%s/<C-r><C-w>//g<Left><Left>")
