local map = function(mode, lhs, rhs, opts)
  if lhs == "" then return end
  opts = vim.tbl_deep_extend("force", { silent = true, unique = true }, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end

map("i", "kj", "<ESC><Cmd>silent! update | redraw<CR>", { desc = "Escape" })

-- Improve j/k motions
map({ "n", "x" }, "j", [[v:count == 0 ? 'gj' : 'j']], { expr = true })
map({ "n", "x" }, "k", [[v:count == 0 ? 'gk' : 'k']], { expr = true })

-- Copy/paste with system clipboard
map({ "n", "x" }, "gy", '"+y', { desc = "Copy to system clipboard" })
map("n", "gp", '"+p', { desc = "Paste from system clipboard" })
map("x", "gp", '"+P', { desc = "Paste from system clipboard" })

-- "b" stands for buffers
map("n", "<leader>ba", "<Cmd>b#<CR>", { desc = "Alternate" })
map("n", "<leader>bd", "<Cmd>lua MiniBufremove.delete()<CR>", { desc = "Delete" })

-- "e" stands for explore
map("n", "<leader>ee", "<Cmd>Oil<CR>", { desc = "Oil" })

-- "f" stands for fuzzy
map("n", "<leader>fa", "<Cmd>Telescope git_status<CR>", { desc = "Status" })
map("n", "<leader>fb", "<Cmd>Telescope buffers<CR>", { desc = "Buffers" })
map("n", "<leader>ff", "<Cmd>Telescope find_files<CR>", { desc = "Files" })
map("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>", { desc = "Grep" })
map("n", "<leader>fh", "<Cmd>Telescope help_tags<CR>", { desc = "Help" })
map("n", "<leader>fl", "<Cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Lines" })
map("n", "<leader>ft", "<Cmd>TodoTelescope<CR>", { desc = "Todo" })

local pickers = require("telescope.builtin")

map(
  "n",
  "gw",
  function() pickers.current_buffer_fuzzy_find({ default_text = vim.fn.expand("<cword>") }) end,
  { desc = "Telescope: fuzzy find word under cursor in current buffer" }
)
map(
  "n",
  "<leader>fw",
  function() pickers.live_grep({ default_text = vim.fn.expand("<cword>") }) end,
  { desc = "Telescope: live grep word under cursor (cwd>" }
)

-- "g" stands for git
map("n", "<leader>gg", "<Cmd>Neogit<CR>", { desc = "Neogit" })

-- "l" stands for LSP
map("n", "<leader>ld", "<Cmd>Telescope diagnostics<cr>", { desc = "diagnostics" })
map("n", "<leader>le", vim.diagnostic.open_float, { desc = "Diagnostics" })
map("n", "<leader>li", "<Cmd>Telescope lsp_implementations<CR>", { desc = "Implementations" })
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>ls", "<Cmd>Telescope lsp_document_symbols<CR>", { desc = "Symbols (buffer)" })
map("n", "<leader>lt", "<Cmd>FzfLua lsp_typedefs<CR>", { desc = "Type Definitions" })
map("n", "<leader>lw", "<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { desc = "Symbols (workspace)" })
map("n", "<leader>lx", "<Cmd>lua vim.diagnostic.setloclist()<CR>", { desc = "Diagnostics (LocList)" })

-- Related LSP mappings
map("n", "gd", "<Cmd>Telescope lsp_definitions<CR>", { desc = "Definitions" })
map("n", "gr", "<Cmd>Telescope lsp_references<CR>", { desc = "References" })
map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { desc = "Code action" })

-- "t" stands for testing
map("n", "tf", "<Cmd>TestFile<CR>", { desc = "File" })
map("n", "tF", "<Cmd>TestFile --coverage<CR>", { desc = "File (coverage)" })
map("n", "tl", "<Cmd>TestLast<CR>", { desc = "Last" })
map("n", "tt", "<Cmd>TestNearest<CR>", { desc = "Nearest" })
map("n", "tv", "<Cmd>TestVisit<CR>", { desc = "Visit" })
