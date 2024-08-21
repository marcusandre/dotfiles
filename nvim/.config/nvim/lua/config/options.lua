vim.cmd("filetype plugin indent on") -- Enable all filetype plugins

-- Backups
vim.opt.undofile = true -- Enable persistent undo
vim.opt.backup = false -- Don't store backup while overwriting a file
vim.opt.writebackup = false -- Don't store backup while overwriting a file

vim.opt.hidden = true
vim.opt.swapfile = false

-- Text formatting
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.smarttab = true

-- Editing
vim.opt.ignorecase = true -- Ignore case when searching (use `\C` to force not doing that)
vim.opt.incsearch = true -- Show search results while typing
vim.opt.infercase = true -- Infer letter cases for a richer built-in keyword completion
vim.opt.smartcase = true -- Don't ignore case when searching if pattern has upper case
vim.opt.smartindent = true -- Make indenting smart
vim.opt.formatoptions = "qjl1" -- Don't autoformat comments

-- Appearance
vim.opt.splitbelow = true -- Horizontal splits will open below
vim.opt.splitright = true -- Vertical splits will open to the right
vim.opt.mouse = "a" -- Enable mouse for all available modes
vim.opt.relativenumber = true -- Show line numbers relative to current line
vim.opt.number = true -- Show line numbers
vim.opt.linespace = 0
vim.opt.report = 0
vim.opt.shortmess = "aOstTc"
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.signcolumn = "yes" -- Always show sign column to prevent text shifts
vim.opt.completeopt = "menuone,noselect"
vim.opt.conceallevel = 2
vim.opt.laststatus = 2
vim.opt.colorcolumn = "80"
vim.opt.shortmess:append("Wc") -- Reduce command line messages
vim.opt.listchars = "tab:> ,extends:…,precedes:…,nbsp:␣" -- Define which helper symbols to show
vim.opt.list = true -- Show some helper symbols

vim.opt.wrap = false -- Display long lines as just one line
vim.opt.linebreak = true -- Wrap long lines at 'breakat' (if 'wrap' is set)
vim.opt.breakindent = true -- Indent wrapped lines to match line start
vim.opt.cursorline = true -- Highlight current line

-- Colorscheme
vim.cmd("colorscheme tokyonight-storm")
