local map = vim.keymap.set

-- Specify leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Move up/down by display lines when long lines wrap:
map("n", "j", "gj")
map("n", "k", "gk")

-- Stay in visual mode when indenting:
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Manage system clipboard
map("n", "<leader>cp", '"+p', { desc = "paste from system clipboard" })
map("v", "gy", '"+y', { desc = "yank to system clipboard" })

-- Navigate buffers
map("n", "[b", ":bp<CR>", { desc = "previous buffer" })
map("n", "]b", ":bn<CR>", { desc = "next buffer" })

-- Manage buffers
map("n", "<leader>ba", "<Cmd>b#<CR>", { desc = "Alternate" })
map("n", "<leader>bd", "<Cmd>lua MiniBufremove.delete()<CR>", { desc = "Delete" })
map("n", "<leader>bo", "<Cmd>%bd|e#|bd#<CR>", { desc = "Delete Other Buffers" })

-- Search and replace selections
map("n", "<leader>sr", ":%s/<C-r><C-w>//g<Left><Left>")
map("v", "<leader>sr", '"hy:%s/<C-r>h//gc<left><left><left>')

-- Cannot escape my muscle memory
map("i", "kj", "<esc>")

-- Resize panes with arrows
map("n", "<down>", ":resize +2<cr>")
map("n", "<up>", ":resize -2<cr>")
map("n", "<right>", ":vertical resize +2<cr>")
map("n", "<left>", ":vertical resize -2<cr>")

-- Improved up/down motions
map("n", "j", "(v:count ? 'j' : 'gj')", { expr = true })
map("n", "k", "(v:count ? 'k' : 'gk')", { expr = true })
