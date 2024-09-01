return {
  {
    "vim-test/vim-test",
    dependencies = { "tpope/vim-projectionist" },
    config = function() vim.g["test#strategy"] = "wezterm" end,
  },
  {
    "andythigpen/nvim-coverage",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
}
