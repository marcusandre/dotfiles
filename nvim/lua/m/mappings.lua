-- Buffers
vim.keymap.set('n', '<leader><leader>', '<Cmd>b#<CR>', { desc = "Buffer: Toggle" })
vim.keymap.set('n', '<leader>q', '<cmd>lua MiniBufremove.delete()<cr>', { desc = "buffer: Delete" })
vim.keymap.set('n', '<leader>bw', '<Cmd>lua MiniBufremove.wipeout()<CR>', { desc = "Buffer: Wipeout" })
vim.keymap.set('n', '<leader>bW', '<Cmd>lua MiniBufremove.wipeout(0, true)<CR>', { desc = "Buffer: Wipeout!" })

-- Find
vim.keymap.set('n', '<leader>f/', '<Cmd>Telescope search_history<CR>',            { desc = '"/" history'})
vim.keymap.set('n', '<leader>f:', '<Cmd>Telescope command_history<CR>',           { desc = 'Find: commands' })
vim.keymap.set('n', '<leader>fB', '<Cmd>Telescope current_buffer_fuzzy_find<CR>', { desc = 'Find: open buffers' })
vim.keymap.set('n', '<leader>fC', '<Cmd>Telescope git_bcommits<CR>',              { desc = 'Find: buffer commits' })
vim.keymap.set('n', '<leader>fD', '<Cmd>Telescope diagnostics bufnr=0<CR>',       { desc = 'Find: diagnostic buffer' })
vim.keymap.set('n', '<leader>fH', '<Cmd>Telescope highlights<CR>',                { desc = 'Find: highlight groups' })
vim.keymap.set('n', '<leader>fO', '<Cmd>Telescope vim_options<CR>',               { desc = 'Find: options' })
vim.keymap.set('n', '<leader>fR', '<Cmd>Telescope lsp_references<CR>',            { desc = 'Find: references (LSP)' })
vim.keymap.set('n', '<leader>fS', '<Cmd>Telescope treesitter<CR>',                { desc = 'Find: symbols (treesitter)' })
vim.keymap.set('n', '<leader>fb', '<Cmd>Telescope buffers<CR>',                   { desc = 'Find: open buffers' })
vim.keymap.set('n', '<leader>fc', '<Cmd>Telescope git_commits<CR>',               { desc = 'Find: commits' })
vim.keymap.set('n', '<leader>fd', '<Cmd>Telescope diagnostics<CR>',               { desc = 'Find: diagnostic workspace' })
vim.keymap.set('n', '<leader>ff', '<Cmd>Telescope find_files<cr>',                { desc = 'Find: files' })
vim.keymap.set('n', '<leader>fg', '<Cmd>Telescope live_grep<CR>',                 { desc = 'Find: grep search' })
vim.keymap.set('n', '<leader>fh', '<Cmd>Telescope help_tags<CR>',                 { desc = 'Find: help tags' })
vim.keymap.set('n', '<leader>fj', '<Cmd>Telescope jumplist<CR>',                  { desc = 'Find: jumplist' })
vim.keymap.set('n', '<leader>fo', '<Cmd>Telescope oldfiles<CR>',                  { desc = 'Find: old files' })
vim.keymap.set('n', '<leader>fr', '<Cmd>Telescope resume<CR>',                    { desc = 'Find: resume' })
vim.keymap.set('n', '<leader>fs', '<Cmd>Telescope git_status<CR>',                { desc = 'Find: git status' })
vim.keymap.set('n', '<leader>ft', '<Cmd>Telescope file_browser<CR>',              { desc = 'Find: file browser' })

-- Git
vim.keymap.set('n', '[h', '<Cmd>lua require("gitsigns").prev_hunk()<CR>',                   { desc =  'Git: previous hunk' })
vim.keymap.set('n', ']h', '<Cmd>lua require("gitsigns").next_hunk()<CR>',                   { desc =  'Git: next hunk' })

-- LSP
vim.keymap.set('n', '<leader>le', '<Cmd>lua vim.lsp.buf.code_action()<CR>',            { desc =  'LSP: code action' })
vim.keymap.set('n', '<leader>lf', '<Cmd>lua vim.lsp.buf.format({ async = true })<CR>', { desc =  'LSP: format' })
vim.keymap.set('n', '<leader>lR', '<Cmd>lua vim.lsp.buf.references()<CR>',             { desc =  'LSP: references' })
vim.keymap.set('n', '<leader>la', '<Cmd>lua vim.lsp.buf.signature_help()<CR>',         { desc =  'LSP: arguments popup' })
vim.keymap.set('n', '<leader>ld', '<Cmd>lua vim.diagnostic.open_float()<CR>',          { desc =  'LSP: diagnostics popup' })
vim.keymap.set('n', '<leader>li', '<Cmd>lua vim.lsp.buf.hover()<CR>',                  { desc =  'LSP: information' })
vim.keymap.set('n', '<leader>lr', '<Cmd>lua vim.lsp.buf.rename()<CR>',                 { desc =  'LSP: rename' })
vim.keymap.set('n', '<leader>ls', '<Cmd>lua vim.lsp.buf.definition()<CR>',             { desc =  'LSP: source definition' })

-- Explore
vim.keymap.set('n', '<leader>et', '<Cmd>NvimTreeToggle<CR>', { desc = "Explore: Tree" })
vim.keymap.set('n', '<leader>eu', '<Cmd>UndotreeToggle<CR>', { desc = "Explore: Undo" })

-- Test
vim.keymap.set('n', '<leader>tF', '<Cmd>TestFile -strategy=make | copen<CR>',    { desc =  'Test: file (quickfix)' })
vim.keymap.set('n', '<leader>tf', '<Cmd>TestFile<CR>',                           { desc =  'Test: file' })
vim.keymap.set('n', '<leader>tL', '<Cmd>TestLast -strategy=make | copen<CR>',    { desc =  'Test: last (quickfix)' })
vim.keymap.set('n', '<leader>tl', '<Cmd>TestLast<CR>',                           { desc =  'Test: last' })
vim.keymap.set('n', '<leader>tN', '<Cmd>TestNearest -strategy=make | copen<CR>', { desc =  'Test: nearest (quickfix)' })
vim.keymap.set('n', '<leader>tn', '<Cmd>TestNearest<CR>',                        { desc =  'Test: nearest' })
vim.keymap.set('n', '<leader>tS', '<Cmd>TestSuite -strategy=make | copen<CR>',   { desc =  'Test: suite (quickfix)' })
vim.keymap.set('n', '<leader>ts', '<Cmd>TestSuite<CR>',                          { desc =  'Test: suite' })

-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
