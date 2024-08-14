-- Save undo history to file and disable backups:
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.writebackup = false
vim.opt.undofile = true

-- Show line numbers:
vim.wo.number = true

-- Show relative line numbers
vim.wo.relativenumber = true

-- Highlight column number 80:
vim.wo.colorcolumn = "80"

-- Break lines when wrapping at punctuation:
vim.wo.linebreak = true

-- Visually indent each wrapped line:
vim.wo.breakindent = true

-- Ignore case when searching with all lowercase queries:
vim.o.ignorecase = true
vim.o.smartcase = true

-- Live preview of substitutions:
vim.o.inccommand = "split"

-- Split windows below right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Always show signcolumn
vim.opt.signcolumn = "yes"

-- Show matches visually
vim.opt.showmatch = true
vim.opt.matchtime = 2

-- Highlight the current line
vim.opt.cursorline = true

-- Prevent wrapping long lines
vim.opt.wrap = false

-- Set shell to bash
-- vim.opt.shell = "/bin/bash"

-- Prevent comments on new lines
vim.opt.formatoptions:remove("o")

-- Completion settings with consecutive presses of TAB:
vim.o.wildmode = "longest,list,full"

-- Keep some lines above and below cursor:
vim.o.scrolloff = 3

-- Allow placing the cursor anywhere:
vim.o.virtualedit = "block"
