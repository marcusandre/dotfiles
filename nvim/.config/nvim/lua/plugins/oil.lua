return {
  "stevearc/oil.nvim",
  dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
  keys = {
    { "<leader>e", "<Cmd>Oil<CR>", desc = "Oil" },
  },
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
  },
}
