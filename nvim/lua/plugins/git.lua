return {
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      { "[h", "<Cmd>Gitsigns prev_hunk<CR>", desc = "Git: previous hunk" },
      { "]h", "<Cmd>Gitsigns next_hunk<CR>", desc = "Git: next hunk" },
    },
    opts = {},
  },
}
