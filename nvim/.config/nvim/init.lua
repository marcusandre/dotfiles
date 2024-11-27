-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = { { import = "plugins" } },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = false },
  change_detection = { enabled = false },
})

vim.opt.inccommand = "split"
vim.opt.visualbell = true

vim.cmd("colorscheme default")

vim.keymap.set("n", "<leader>w", "<Cmd>write<CR>", { desc = "Write" })
vim.keymap.set("n", "<leader>q", "<Cmd>quit<CR>", { desc = "Quit" })

vim.keymap.set("n", "<leader><space>", "<Cmd>b#<CR>", { desc = "Alternate buffer" })

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.keymap.set("i", "kj", "<Esc>")
