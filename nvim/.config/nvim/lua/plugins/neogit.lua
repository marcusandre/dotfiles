return {
  "NeogitOrg/neogit",
  cmd = "Neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  keys = {
    { "<leader>n", "<Cmd>Neogit<CR>", desc = "Neogit" },
  },
  config = true,
}
