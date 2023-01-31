local status, tree = pcall(require, "nvim-tree")
if (not status) then return end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

tree.setup {
  disable_netrw = true,
  -- open_on_setup = true,
  auto_reload_on_write = true,
  git = {
    enable = true,
  },
  modified = {
    enable = true,
  },
  view = {
    adaptive_size = true,
  }
}

vim.keymap.set("n", "<leader>x", "<cmd>NvimTreeFindFileToggle<CR>")
