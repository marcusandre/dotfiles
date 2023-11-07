-- General
vim.g.mapleader = " "

-- General
-- stylua: ignore start
vim.o.undofile       = true  -- Enable persitent undo

vim.o.backup         = false -- Don't store backup while overwriting the file
vim.o.writebackup    = false -- Don't store backup while overwriting the file

vim.o.mouse          = 'a'   -- Enable mouse for all available modes
-- stylua: ignore end

-- UI
-- stylua: ignore start
vim.o.breakindent    = true -- Indend wrapped lines to match line start
vim.o.cursorline     = true -- Highlight current line
vim.o.linebreak      = true -- Wrap long lines at 'breakat'
vim.o.number         = true -- Show line numbers
vim.o.relativenumber = true -- Show relative line numbers
vim.o.splitbelow     = true -- Horizontal splits will be shown below
vim.o.splitright     = true -- Vertical splits will be shown to the right
vim.o.termguicolors  = true -- Enable gui colors

vim.o.ruler          = false -- Don't show cursor position in command line
vim.o.showmode       = false -- Don't show mode in command line
vim.o.wrap           = false -- Display long lines as just one line

vim.o.pumblend       = 10 -- Make builtin completion menus slightly transparent
vim.o.pumheight      = 10 -- Make popup menu smaller
vim.o.winblend       = 10 -- Make floating windows slightly transparent

vim.o.listchars      = 'extends:…,precedes:…,nbsp:␣' -- Define which helper symbols to show
vim.o.list           = true -- Show some helper symbols

-- Enable syntax highlighing if it wasn't already
if vim.fn.exists("syntax_on") ~= 1 then vim.cmd([[syntax enable]]) end
-- stylua: ignore end

-- Editing
-- stylua: ignore start
vim.o.ignorecase  = true                        -- Ignore case when searching
vim.o.incsearch   = true                        -- Show search results while typing
vim.o.infercase   = true                        -- Infer letter caases for a richer built-in keyword completion
vim.o.smartcase   = true                        -- Don't ignore case whens searching with capiral letters
vim.o.smartindent = true                        -- Make indenting smart
vim.o.autoindent  = true                        -- Use auto indent
vim.opt.iskeyword:append('-')                   -- Treat dash separated words as a word text object

vim.o.completeopt = 'menuone,noinsert,noselect' -- Customize completions
vim.o.virtualedit = 'block'                     -- Allow going past the end of line in visual block mode
vim.o.formatoptions = 'qjl1'                    -- Don't autoformat comments

vim.opt.shortmess:append('WcC')                 -- Reduce command line messages
vim.o.splitkeep = 'screen'                      -- Reduce scroll during window split

vim.o.fillchars = "eob: "                       -- Don't show `~` outside of buffer
-- stylua: ignore end

-- Spelling
-- stylua: ignore start
vim.o.spelllang = 'en'            -- Define spelling dictionaries
vim.o.spelloptions = 'camel'      -- Treat parts of camelCase words as seprate words

vim.opt.complete:append('kspell') -- Add spellcheck options for autocomplete
vim.opt.complete:remove('t')      -- Don't use tags for completion
-- stylua: ignore end
