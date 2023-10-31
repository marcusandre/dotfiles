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

-- Telescope
vim.keymap.set("n", "<leader>/", "<Cmd>Telescope live_grep<CR>", { desc = "Grep live" })
vim.keymap.set("n", "<leader>:", "<Cmd>Telescope command_history<CR>", { desc = "Commands" })
vim.keymap.set("n", "<leader>fD", "<Cmd>Telescope diagnostics<CR>", { desc = "Diagnostics (Workspace)" })
vim.keymap.set("n", "<leader>fO", "<Cmd>Telescope oldfiles<CR>", { desc = "Old Files (Workspace)" })
vim.keymap.set("n", "<leader>fb", "<Cmd>Telescope buffers<CR>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>fd", "<Cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Diagnostics (Buffer)" })
vim.keymap.set("n", "<leader>ff", '<Cmd>lua require("m.telescope").project_files()<CR>', { desc = "Files" })
vim.keymap.set("n", "<leader>fg", "<Cmd>Telescope git_status<cr>", { desc = "Git" })
vim.keymap.set("n", "<leader>fh", "<Cmd>Telescope help_tags<cr>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>fj", "<Cmd>Telescope jumplist<CR>", { desc = "Jumplist" })
vim.keymap.set("n", "<leader>fl", "<Cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Lines (current)" })
vim.keymap.set("n", "<leader>fo", "<Cmd>Telescope oldfiles only_cwd=true<CR>", { desc = "Old Files" })
vim.keymap.set("n", "<leader>fr", "<Cmd>Telescope resume<CR>", { desc = "Resume" })
vim.keymap.set("n", "<leader>fs", "<Cmd>Telescope lsp_document_symbols<CR>", { desc = "Symbols current (LSP)" })
vim.keymap.set("n", "<leader>ft", "<Cmd>Telescope treesitter<CR>", { desc = "Document (Treesitter)" })
vim.keymap.set(
  "n",
  "<leader>fS",
  "<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
  { desc = "Symbols workspace (LSP)" }
)

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Information" })
vim.keymap.set("n", "gD", "<Cmd>Telescope lsp_type_definitions<CR>", { desc = "Type definitions (LSP)" })
vim.keymap.set("n", "gd", "<Cmd>Telescope lsp_definitions<CR>", { desc = "Definitions (LSP)" })
vim.keymap.set("n", "gi", "<Cmd>Telescope lsp_implementations<CR>", { desc = "Implementations (LSP)" })
vim.keymap.set("n", "gr", "<Cmd>Telescope lsp_references<CR>", { desc = "References (LSP)" })
vim.keymap.set("n", "gw", "<Cmd>Telescope grep_string<CR>", { desc = "Grep current word" })

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

-- Pick
vim.keymap.set("n", "<leader>p/", "<Cmd>Pick grep_live<CR>", { desc = "Live Grep" })
vim.keymap.set("n", "<leader>pb", "<Cmd>Pick buffers include_current=true<CR>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>pf", "<Cmd>Pick files<CR>", { desc = "Files" })
vim.keymap.set("n", "<leader>pr", "<Cmd>Pick resume<CR>", { desc = "Resume" })

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
vim.keymap.set("n", "<leader>ee", "<Cmd>NvimTreeToggle<cr>", { desc = "Explore: Tree" })
vim.keymap.set("n", "<leader>ef", "<Cmd>NvimTreeFindFileToggle<cr>", { desc = "Explore: Tree (File)" })

-- Other
vim.keymap.set("n", "<leader>oc", utils.toggle_quickfix, { desc = "Quickfix: Toggle" })
vim.keymap.set("n", "<leader>of", "<Cmd>lua MiniFiles.open()<cr>", { desc = "MiniFiles" })
vim.keymap.set("n", "<leader>ol", "<Cmd>Lazy<CR>", { desc = "Lazy" })
vim.keymap.set("n", "<leader>om", "<Cmd>Mason<CR>", { desc = "Mason" })
vim.keymap.set("n", "<leader>oo", "<Cmd>only<CR>", { desc = "Window: Only" })
vim.keymap.set("n", "<leader>or", "<Cmd>lua MiniMisc.resize_window()<CR>", { desc = "Resize to defaut width" })
vim.keymap.set("n", "<leader>oz", "<Cmd>lua MiniMisc.zoom()<CR>", { desc = "Zoom toggle" })
