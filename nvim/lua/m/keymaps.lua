local utils = require("m.utils")

-- Basics
vim.keymap.set("i", "kj", "<esc>")
vim.keymap.set("n", "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "n", "nzz")

-- Buffers
vim.keymap.set("n", "<leader>ba", "<Cmd>b#<CR>", { desc = "Alternate" })
vim.keymap.set("n", "<leader>bd", utils.delete_buffer, { desc = "Delete" })
vim.keymap.set("n", "<leader>bD", function() utils.delete_buffer(0, true) end, { desc = "Delete!" })
vim.keymap.set("n", "<leader>bq", utils.delete_other_buffers, { desc = "Delete Others" })
vim.keymap.set("n", "<leader>bQ", utils.delete_all_buffers, { desc = "Delete All" })
vim.keymap.set("n", "<leader>bs", utils.make_scratch_buffer, { desc = "Scratch" })
vim.keymap.set("n", "<leader>bw", utils.wipeout_buffer, { desc = "Wipeout" })
vim.keymap.set("n", "<leader>bW", function() utils.wipeout_buffer(0, true) end, { desc = "Wipeout!" })

-- Git
vim.keymap.set("n", "<leader>gA", '<Cmd>lua require("gitsigns").stage_buffer()<CR>', { desc = "Add buffer" })
vim.keymap.set(
  "n",
  "<leader>gX",
  '<Cmd>lua require("gitsigns").reset_buffer()<CR>',
  { desc = "Discard (reset) buffer" }
)
vim.keymap.set("n", "<leader>ga", '<Cmd>lua require("gitsigns").stage_hunk()<CR>', { desc = "Add (stage) hunk" })
vim.keymap.set("n", "<leader>gb", '<Cmd>lua require("gitsigns").blame_line()<CR>', { desc = "Blame line" })
vim.keymap.set("n", "<leader>gg", "<Cmd>Git<CR>", { desc = "Open fugitive" })
vim.keymap.set("n", "<leader>gp", '<Cmd>lua require("gitsigns").preview_hunk()<CR>', { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>gq", '<Cmd>lua require("gitsigns").setqflist()<CR>:copen<CR>', { desc = "Quickfix hunks" })
vim.keymap.set("n", "<leader>gu", '<Cmd>lua require("gitsigns").undo_stage_hunk()<CR>', { desc = "Undo stage hunk" })
vim.keymap.set("n", "<leader>gx", '<Cmd>lua require("gitsigns").reset_hunk()<CR>', { desc = "Discard (reset) hunk" })
vim.keymap.set("n", "[h", "<Cmd>Gitsigns prev_hunk<CR>zvzz", { desc = "Goto previous hunk" })
vim.keymap.set("n", "]h", "<Cmd>Gitsigns next_hunk<CR>zvzz", { desc = "Goto next hunk" })

-- Pick
vim.keymap.set("n", ",", '<Cmd>Pick buf_lines scope="current"<CR>', { desc = "Lines" })
vim.keymap.set("n", "<leader>/", "<Cmd>Pick grep_live<CR>", { desc = "Live Grep" })
vim.keymap.set("n", "<leader>:", "<Cmd>Pick history<CR>", { desc = "History" })
vim.keymap.set("n", "<leader>fb", "<Cmd>Pick buffers include_current=true<CR>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>fD", '<Cmd>Pick diagnostic scope="all"<CR>', { desc = "Diagnostics (Workspace)" })
vim.keymap.set("n", "<leader>fd", '<Cmd>Pick diagnostic scope="current"<CR>', { desc = "Diagnostics (Buffer)" })
vim.keymap.set("n", "<leader>ff", "<Cmd>Pick files<CR>", { desc = "Files" })
vim.keymap.set("n", "<leader>fG", "<Cmd>Pick git_hunks<CR>", { desc = "Git hunks" })
vim.keymap.set("n", "<leader>fg", '<Cmd>Pick git_files scope="modified"<CR>', { desc = "Git files" })
vim.keymap.set("n", "<leader>fh", "<Cmd>Pick help<CR>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>fj", '<Cmd>Pick list scope="jump"<CR>', { desc = "Jumplist" })
vim.keymap.set("n", "<leader>fo", "<Cmd>Pick oldfiles<CR>", { desc = "Old Files" })
vim.keymap.set("n", "<leader>fr", "<Cmd>Pick resume<CR>", { desc = "Resume" })
vim.keymap.set("n", "<leader>fs", '<Cmd>Pick lsp scope="document_symbol"<CR>', { desc = "Symbols (Buffer)" })
vim.keymap.set("n", "<leader>fS", '<Cmd>Pick lsp scope="workspace_symbol"<CR>', { desc = "Symbols (Workspace)" })
vim.keymap.set("n", "<leader>ft", "<Cmd>Pick treesitter<CR>", { desc = "Treesitter" })

-- LSP
vim.keymap.set("n", "gD", '<Cmd>Pick lsp scope="declaration"<CR>', { desc = "Declaration (LSP)" })
vim.keymap.set("n", "gd", '<Cmd>Pick lsp scope="definition"<CR>', { desc = "Definition (LSP)" })
vim.keymap.set("n", "gi", '<Cmd>Pick lsp scope="implementation"<CR>', { desc = "Implementation (LSP)" })
vim.keymap.set("n", "gr", '<Cmd>Pick lsp scope="references"<CR>', { desc = "References (LSP)" })
vim.keymap.set("n", "gw", utils.pick_word_under_cursor, { desc = "Grep word (LSP)" })
vim.keymap.set("n", "gl", '<Cmd>Pick lsp scope="type_definition"<CR>', { desc = "Type definition (LSP)" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Information" })

-- LSP (Leader)
vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, { desc = "Declaration" })
vim.keymap.set("n", "<leader>lR", vim.lsp.buf.references, { desc = "References" })
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Definition" })
vim.keymap.set("n", "<leader>lf", "<Cmd>lua vim.lsp.buf.format({ async = true })<CR>", { desc = "Format" })
vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, { desc = "Implementation" })
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, { desc = "Signature" })
vim.keymap.set("n", "<leader>ly", vim.lsp.buf.type_definition, { desc = "Type Definition" })
vim.keymap.set("v", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("x", "<leader>lf", "<Cmd>lua vim.lsp.buf.format({ async = true })<CR>", { desc = "Format" })

-- Testing
vim.keymap.set("n", "<leader>tF", "<Cmd>TestFile --coverage<CR>", { desc = "Test: file (coverage)" })
vim.keymap.set("n", "<leader>tL", "<Cmd>TestLast --coverage<CR>", { desc = "Test: last (coverage)" })
vim.keymap.set("n", "<leader>tN", "<Cmd>TestNearest --coverage<CR>", { desc = "Test: nearest (coverage)" })
vim.keymap.set("n", "<leader>tS", "<Cmd>TestSuite --coverage<CR>", { desc = "Test: suite (coverage)" })
vim.keymap.set("n", "<leader>tf", "<Cmd>TestFile<CR>", { desc = "Test: file" })
vim.keymap.set("n", "<leader>tl", "<Cmd>TestLast<CR>", { desc = "Test: last" })
vim.keymap.set("n", "<leader>tn", "<Cmd>TestNearest<CR>", { desc = "Test: nearest" })
vim.keymap.set("n", "<leader>ts", "<Cmd>TestSuite<CR>", { desc = "Test: suite" })
vim.keymap.set("n", "<leader>tv", "<Cmd>TestVisit<CR>", { desc = "Test: visit" })
vim.keymap.set("n", "<leader>tc", "<Cmd>Coverage<CR>", { desc = "Test: coverage" })

-- Explore
vim.keymap.set("n", "<leader>eu", "<CMD>UndotreeToggle<CR>", { desc = "Open Undotree" })
vim.keymap.set("n", "<leader>ee", "<Cmd>lua MiniFiles.open()<cr>", { desc = "MiniFiles" })
vim.keymap.set("n", "-", "<Cmd>lua MiniFiles.open()<cr>", { desc = "MiniFiles" })

-- Other
vim.keymap.set("n", "<leader>oc", utils.toggle_quickfix, { desc = "Quickfix: Toggle" })
vim.keymap.set("n", "<leader>ol", "<Cmd>Lazy<CR>", { desc = "Lazy" })
vim.keymap.set("n", "<leader>om", "<Cmd>Mason<CR>", { desc = "Mason" })
vim.keymap.set("n", "<leader>oo", "<Cmd>only<CR>", { desc = "Window: Only" })
vim.keymap.set("n", "<leader>or", "<Cmd>lua MiniMisc.resize_window()<CR>", { desc = "Resize to defaut width" })
vim.keymap.set("n", "<leader>oz", "<Cmd>lua MiniMisc.zoom()<CR>", { desc = "Zoom toggle" })
