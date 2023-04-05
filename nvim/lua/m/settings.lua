-- General
vim.g.mapleader = ' '

vim.cmd('filetype plugin indent on')

-- UI
vim.o.breakindent    = true     -- Indent wrapped lines to match line start
vim.o.colorcolumn    = '+1'     -- Draw colored column one step to the right of desired maximum width
vim.o.cursorline     = true     -- Enable highlighting of the current line
vim.o.laststatus     = 2        -- Always show statusline
vim.o.linebreak      = true     -- Wrap long lines at 'breakat' (if 'wrap' is set)
vim.o.list           = true     -- Show helpful character indicators
vim.o.number         = true     -- Show line numbers
vim.o.relativenumber = true     -- Show line numbers relative to current line
vim.o.pumblend       = 10       -- Make builtin completion menus slightly transparent
vim.o.pumheight      = 10       -- Make popup menu smaller
vim.o.ruler          = false    -- Don't show cursor position
vim.o.shortmess      = 'aoOWFc' -- Disable certain messages from |ins-completion-menu|
vim.o.showtabline    = 2        -- Always show tabline
vim.o.signcolumn     = 'yes'    -- Always show signcolumn or it would frequently shift
vim.o.splitbelow     = true     -- Horizontal splits will be below
vim.o.splitright     = true     -- Vertical splits will be to the right
vim.o.termguicolors  = true     -- Enable gui colors
vim.o.winblend       = 10       -- Make floating windows slightly transparent
vim.o.wrap           = false    -- Display long lines as just one line
vim.o.mouse          = 'a'      -- Enable mouse usage

-- Colors
if vim.fn.exists("syntax_on") ~= 1 then
  vim.cmd([[syntax enable]])
end

vim.cmd('au VimEnter * nested ++once colorscheme dayfox')

-- Editing
vim.o.autoindent    = true                        -- Use auto indent
vim.o.expandtab     = true                        -- Convert tabs to spaces
vim.o.formatoptions = 'rqnl1j'                    -- Improve comment editing
vim.o.ignorecase    = true                        -- Ignore case when searching (use `\C` to force not doing that)
vim.o.incsearch     = true                        -- Show search results while typing
vim.o.infercase     = true                        -- Infer letter cases for a richer built-in keyword completion
vim.o.shiftwidth    = 2                           -- Use this number of spaces for indentation
vim.o.smartcase     = true                        -- Don't ignore case when searching if pattern has upper case
vim.o.smartindent   = true                        -- Make indenting smart
vim.o.tabstop       = 2                           -- Insert 2 spaces for a tab
vim.o.virtualedit   = 'block'                     -- Allow going past the end of line in visual block mode
vim.o.completeopt   = 'menuone,noinsert,noselect' -- Customize completions

vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]

vim.opt.iskeyword:append('-') -- Treat dash separated words as a word text object

-- Netrw
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- Spelling
vim.o.spelllang          = 'en,de,uk' -- Define spelling dictionaries
vim.o.spelloptions       = 'camel'    -- Treat parts of camelCase words as seprate words

vim.opt.complete:append('kspell')     -- Add spellcheck options for autocomplete
vim.opt.complete:remove('t')          -- Don't use tags for completion

-- Highlight Yanks
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
