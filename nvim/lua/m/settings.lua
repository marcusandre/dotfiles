--- Settings

-- General
vim.o.undofile = true -- Enable persistent undo
vim.o.backup = false -- Don't store backup while overwriting the file
vim.o.writebackup = false -- Don't store backup while overwriting the file
vim.o.mouse = 'a' -- Enable mouse for all available modes

vim.cmd('filetype plugin indent on') -- Enable all filetype plugins

-- UI
vim.o.breakindent = true -- Indent wrapped lines to match line start
vim.o.colorcolumn = '+1' -- Highlight column after 'textwidth'
vim.o.cursorline = true -- Highlight current line
vim.o.laststatus = 2 -- Always show the statusline
vim.o.linebreak = true -- Wrap long lines at 'breakat' (if 'wrap' is set)
vim.o.number = true -- Show line numbers
vim.o.relativenumber = true -- Show line numbers relative
vim.o.splitbelow = true -- Horizontal splits will be below
vim.o.splitright = true -- Vertical splits will be to the right
vim.o.pumblend = 10 -- Transparent completion menus
vim.o.winblend = 10 -- Transparent floating windows
vim.o.ruler = false -- Dont show cursor position
vim.o.showtabline = 2 -- Always show line with tab page labels

vim.o.ruler = false -- Don't show cursor position in command line
vim.o.wrap = false -- Display long lines as just one line

vim.o.signcolumn = 'yes' -- Always show sign column (otherwise it will shift text)
vim.o.fillchars = 'eob: ' -- Don't show `~` outside of buffer

vim.o.listchars = 'tab:> ,extends:…,precedes:…,nbsp:␣' -- Define which helper symbols to show
vim.o.list = true -- Show some helper symbols

-- Editing
vim.o.autoindent = true -- Automatically indent
vim.o.expandtab = true -- Tabs to spaces
vim.o.ignorecase = true -- Ignore case when searching (use `\C` to force not doing that)
vim.o.incsearch = true -- Show search results while typing
vim.o.infercase = true -- Infer letter cases for a richer built-in keyword completion
vim.o.smartcase = true -- Don't ignore case when searching if pattern has upper case
vim.o.smartindent = true -- Make indenting smart
vim.o.shiftwidth = 2 -- Number of spaces for indentation
vim.o.tabstop = 2 -- Insert 2 spaces for a single tab

vim.o.completeopt = 'menuone,noinsert,noselect' -- Customize completions
vim.o.virtualedit = 'block' -- Allow going past the end of line in visual block mode
vim.o.formatoptions = 'qjl1' -- Don't autoformat comments

vim.opt.iskeyword:append('-') -- Treat das separated words as a word text object

-- Neovim version dependent
if vim.fn.has('nvim-0.9') == 1 then
  vim.opt.shortmess:append('WcC') -- Reduce command line messages
  vim.o.splitkeep = 'screen' -- Reduce scroll during window split
else
  vim.opt.shortmess:append('Wc') -- Reduce command line messages
end

if vim.fn.has('nvim-0.10') == 0 then
  vim.o.termguicolors = true -- Enable gui colors
end

-- Color and Syntax
-- vim.cmd('colorscheme habamax')
vim.cmd('syntax enable')

--- Keymaps

-- Move by visible lines. Notes:
vim.keymap.set({ 'n', 'x' }, 'j', [[v:count == 0 ? 'gj' : 'j']], { expr = true })
vim.keymap.set({ 'n', 'x' }, 'k', [[v:count == 0 ? 'gk' : 'k']], { expr = true })

-- Copy/paste with system clipboard
vim.keymap.set({ 'n', 'x' }, 'gy', '"+y', { desc = 'Copy to system clipboard' })
vim.keymap.set('n', 'gp', '"+p', { desc = 'Paste from system clipboard' })

-- Alternative way to save and exit in Normal mode.
vim.keymap.set('n', '<C-S>', '<Cmd>silent! update | redraw<CR>', { desc = 'Save' })
vim.keymap.set({ 'i', 'x' }, '<C-S>', '<Esc><Cmd>silent! update | redraw<CR>', { desc = 'Save and go to Normal mode' })
vim.keymap.set('i', 'kj', '<Esc><Cmd>silent! update | redraw<CR>', { desc = 'Exit input mode' })

-- Window navigation
vim.keymap.set('n', '<C-H>', '<C-w>h', { desc = 'Focus on left window' })
vim.keymap.set('n', '<C-J>', '<C-w>j', { desc = 'Focus on below window' })
vim.keymap.set('n', '<C-K>', '<C-w>k', { desc = 'Focus on above window' })
vim.keymap.set('n', '<C-L>', '<C-w>l', { desc = 'Focus on right window' })
