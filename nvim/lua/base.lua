vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.autoindent = true
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.breakindent = true
vim.opt.colorcolumn = "80"
vim.opt.expandtab = true
vim.opt.exrc = true;
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = 'split'
vim.opt.isfname:append("@-@")
vim.opt.laststatus = 2
vim.opt.path:append { '**' }
vim.opt.ruler = true
vim.opt.scrolloff = 8
vim.opt.shell = 'zsh'
vim.opt.shiftwidth = 2
vim.opt.showcmd = true
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.title = true
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.o.termguicolors = true

if os.getenv('theme') == 'light' then
  vim.api.nvim_set_option('background', 'light')
  vim.cmd.colorscheme "catppuccin-latte"
else
  vim.api.nvim_set_option('background', 'dark')
  vim.cmd.colorscheme "catppuccin-mocha"
end
