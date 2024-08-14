-- Save undo history to file (enables undo between sessions):
vim.bo.undofile = true

-- Show line numbers:
vim.wo.number = true

-- Show relative line numbers
vim.wo.relativenumber = true

-- Highlight column number 80:
vim.wo.colorcolumn = '80'

-- Break lines when wrapping at punctuation:
vim.wo.linebreak = true

-- Visually indent each wrapped line:
vim.wo.breakindent = true

-- Ignore case when searching with all lowercase queries:
vim.o.ignorecase = true
vim.o.smartcase = true

-- Live preview of substitutions:
vim.o.inccommand = 'split'

-- Completion settings with consecutive presses of TAB:
vim.o.wildmode = 'longest,list,full'

-- Keep some lines above and below cursor:
vim.o.scrolloff = 3

-- Allow placing the cursor anywhere:
vim.o.virtualedit = 'block'
