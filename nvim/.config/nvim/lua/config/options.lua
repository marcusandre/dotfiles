-- Enable all filetype plugins
vim.cmd("filetype plugin indent on")

local o = vim.opt

-- Backups
o.undofile = true -- Enable persistent undo history
o.writebackup = false -- Don't store backup while overwriting a file

-- Editing
o.ignorecase = true -- Ignore case when searching (use `\C` to force not doing that)
o.incsearch = true -- Show search results while typing
o.infercase = true -- Infer letter cases for a richer built-in keyword completion
o.smartcase = true -- Don't ignore case when searching if pattern has upper case
o.smartindent = true -- Make indenting smart

o.completeopt = "menuone,noinsert,noselect" -- Customize completions
o.virtualedit = "block" -- Allow going past the end of line in visual block mode
o.formatoptions = "qjl1" -- Don't autoformat comments

o.mouse = "a" -- Enable mouse for all available modes

vim.opt.inccommand = "split" -- Show the effect of substitutions

-- Appearance
o.relativenumber = true -- Show relative line numbers
o.breakindent = true -- Indent wrapped lines to match line start
o.termguicolors = true -- Enable gui colors
o.cursorline = true -- Highlight current line
o.linebreak = true -- Wrap long lines at 'breakat' (if 'wrap' is set)
o.number = true -- Show line numbers
o.splitbelow = true -- Horizontal splits will be below
o.splitright = true -- Vertical splits will be to the right
o.ruler = false -- Don't show cursor position in command line
o.showmode = false -- Don't show mode in command line
o.wrap = false -- Display long lines as just one line
o.signcolumn = "yes" -- Always show sign column (otherwise it will shift text)
o.fillchars = "eob: " -- Don't show `~` outside of buffer
o.shortmess:append("Wc") -- Reduce command line messages
o.pumheight = 10 -- Make popup menu smaller
o.laststatus = 2 -- Always show statusline
o.pumheight = 10 -- Make popup menu smaller

o.listchars = "tab:> ,extends:…,precedes:…,nbsp:␣" -- Define which helper symbols to show
o.list = true -- Show some helper symbols

-- Enable syntax highlighting if it wasn't already
if vim.fn.exists("syntax_on") ~= 1 then vim.cmd([[syntax enable]]) end

vim.cmd("colorscheme tokyonight-night")
