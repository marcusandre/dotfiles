local map = function(mode, lhs, rhs, opts)
  if lhs == "" then return end
  opts = vim.tbl_deep_extend("force", { silent = true, unique = true }, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end

local map_leader = function(mode, lhs, rhs, opts) map(mode, "<leader>" .. lhs, rhs, opts) end

-- Move by visible lines
map({ "n", "x" }, "j", [[v:count == 0 ? 'gj' : 'j']], { expr = true })
map({ "n", "x" }, "k", [[v:count == 0 ? 'gk' : 'k']], { expr = true })

-- Keeping the cursor centered.
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll downwards" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll upwards" })
map("n", "N", "Nzzzv", { desc = "Previous result" })
map("n", "n", "nzzzv", { desc = "Next result" })

-- Indent while remaining in visual mode.
map("v", "<", "<gv", { desc = "Indent current selection" })
map("v", ">", ">gv", { desc = "Outdent current selection" })

-- Save and exit to normal mode
map_leader("n", "w", "<Cmd>silent! update | redraw<CR>", { desc = "Save" })
map({ "i", "x" }, "kj", "<Esc><Cmd>silent! update | redraw<CR>", { desc = "Save and go to Normal mode" })

map("n", "Q", "<nop>")

-- Buffers
map_leader("n", "x", "<Cmd>lua MiniBufremove.delete()<CR>", { desc = "Delete buffer" })
map_leader("n", "<space>", "<Cmd>b#<CR>", { desc = "Show alternate buffer" })

-- LSP
map_leader("n", "k", vim.lsp.buf.hover, { desc = "Show docs for item under cursor" })
map_leader("n", "r", vim.lsp.buf.rename, { desc = "Rename symbol" })
map_leader("n", "e", vim.diagnostic.open_float, { desc = "Show diagnostics" })
map_leader({ "n", "v" }, "a", vim.lsp.buf.code_action, { desc = "Perform code action" })

-- Clipboard
map_leader({ "n", "x" }, "y", '"+y', { desc = "Yank selection to clipboard" })
map_leader("n", "p", '"+p', { desc = "Paste clipboard after selection" })
map_leader("n", "P", '"+P', { desc = "Paste clipboard before selection" })

-- Wansmer/treesj
map("n", "<leader>m", require("treesj").toggle, { desc = "Split/join node under cursor" })
map(
  "n",
  "<leader>M",
  function() require("treesj").toggle({ split = { recursive = true } }) end,
  { desc = "Split/join node under cursor recursive" }
)

-- stevearc/conform.nvim
map_leader("n", "F", function() require("conform").format({ lsp_format = "fallback" }) end, { desc = "Format buffer" })

-- linrongbin16/gitlinker.nvim
map({ "n", "v" }, "gl", "<Cmd>GitBlameCopyFileURL<CR>", { desc = "Yank git link" })
map({ "n", "v" }, "gL", "<Cmd>GitBlameOpenFileURL<CR>", { desc = "Open git link" })

-- vim-test/vim-test
map_leader("n", "tN", "<Cmd>TestNearest --coverage<CR>", { desc = "Test nearest with coverage" })
map_leader("n", "tn", "<Cmd>TestNearest<CR>", { desc = "Test nearest" })
map_leader("n", "tT", "<Cmd>TestFile --coverage<CR>", { desc = "Test file with coverage" })
map_leader("n", "tt", "<Cmd>TestFile<CR>", { desc = "Test file" })
map_leader("n", "tv", "<Cmd>TestVisit<CR>", { desc = "Visit test" })

-- Open
map_leader("n", "og", "<Cmd>Neogit<CR>", { desc = "Neogit" })
map_leader("n", "ol", "<Cmd>Lazy<CR>", { desc = "Lazy" })
map_leader("n", "oo", "<Cmd>Oil<CR>", { desc = "Oil" })
map_leader("n", "or", "<Cmd>OverseerRun<CR>", { desc = "Overseer" })

-- Others
map_leader({ "i", "n" }, "om", ":write<CR>:make<CR>", { desc = "Make" })
