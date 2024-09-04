vim.cmd("filetype plugin indent on") -- Enable all filetype plugins

-- Backups
vim.opt.undofile = true -- Enable persistent undo history
vim.opt.backup = false -- Don't store backup while overwriting a file
vim.opt.writebackup = false -- Don't store backup while overwriting a file

vim.opt.hidden = true
vim.opt.swapfile = false

-- Text formatting
vim.opt.expandtab = true -- Use spaces instead of <Tab>
vim.opt.shiftround = true -- Round indent to multiple of 'shiftwidth'
vim.opt.shiftwidth = 2 -- Two spaces make a <Tab>
vim.opt.softtabstop = 2 -- Two spaces make a <Tab>
vim.opt.tabstop = 2 -- Two spaces make a <Tab>
vim.opt.autoindent = true -- Use current line indent when starting a new line
vim.opt.smarttab = true -- Insert blanks in fron of a line

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
vim.opt.report = 0 -- Always report number of changed lines
vim.opt.shortmess = "aOstTc"
vim.opt.ruler = true -- Show line and column number of the cursor position
vim.opt.showcmd = true -- Always show the current command mode
vim.opt.signcolumn = "yes" -- Always show sign column to prevent text shifts
vim.opt.completeopt = "menu,menuone,noinsert"
vim.opt.conceallevel = 2 -- Hide concealed text completely unless a custom replacement character is defined
vim.opt.laststatus = 2 -- Always show a status line
vim.opt.colorcolumn = "80" -- Highlight line to align text
vim.opt.iskeyword:append("-") -- treat `-` same as `_` character
vim.opt.listchars = "tab:> ,extends:…,precedes:…,nbsp:␣" -- Define which helper symbols to show
vim.opt.list = true -- Show some helper symbols
vim.opt.showtabline = 0 -- Never show line with tab page labels

vim.opt.wrap = false -- Display long lines as just one line
vim.opt.linebreak = true -- Wrap long lines at 'breakat' (if 'wrap' is set)
vim.opt.breakindent = true -- Indent wrapped lines to match line start
vim.opt.cursorline = true -- Highlight current line

vim.opt.inccommand = "split" -- Show the effect of substitutions
