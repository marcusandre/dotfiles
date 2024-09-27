return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  keys = {
    { "<leader>e", "<Cmd>Oil<CR>", desc = "Open file explorer" },
  },
  opts = {
    delete_to_trash = true,
    view_options = {
      show_hidden = false,
    },
  },
}
