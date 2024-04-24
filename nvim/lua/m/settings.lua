-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Make relative line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode to resize splits easier
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true

-- Modern filetype detection
vim.g.do_filetype_lua = 1

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Line wraps
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = '↪'

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Disable intro message
vim.opt.shortmess = 'I'

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
vim.opt.list = true
vim.opt.listchars = {
  tab = '» ',
  trail = '·',
  nbsp = '␣',
}

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true

-- Don't show numbers inside the terminal
vim.cmd('autocmd TermOpen * setlocal norelativenumber nonumber')

-- Start terminal in insert mode
vim.cmd('autocmd TermOpen * startinsert')

-- Disable intro message
vim.o.shortmess = vim.o.shortmess .. 'I'
