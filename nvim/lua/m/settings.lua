-- General
vim.g.mapleader = " "

-- UI
-- stylua: ignore start
vim.o.colorcolumn = '+1'    -- Draw colored column one step to the right of desired maximum width
vim.o.laststatus = 2        -- Always show statusline
vim.o.relativenumber = true -- Show line numbers relative to current line
vim.o.showtabline = 2       -- Always show tabline
-- stylua: ignore end

-- Editing
-- stylua: ignore start
vim.o.autoindent = true       -- Use auto indent
vim.o.expandtab = true        -- Convert tabs to spaces
vim.o.shiftwidth = 2          -- Use this number of spaces for indentation
vim.o.tabstop = 2             -- Insert 2 spaces for a tab
vim.opt.iskeyword:append('-') -- Treat dash separated words as a word text object
vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]
-- stylua: ignore end

-- Netrw
-- stylua: ignore start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- stylua: ignore end

-- Spelling
-- stylua: ignore start
vim.o.spelllang = 'en'            -- Define spelling dictionaries
vim.o.spelloptions = 'camel'      -- Treat parts of camelCase words as seprate words

vim.opt.complete:append('kspell') -- Add spellcheck options for autocomplete
vim.opt.complete:remove('t')      -- Don't use tags for completion
-- stylua: ignore end
