return {
  "tpope/vim-eunuch",
  "tpope/vim-projectionist",
  "tpope/vim-sleuth",
  "tpope/vim-surround",
  "farmergreg/vim-lastplace",

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup({})
    end,
  },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({})
    end,
  },

  -- Themes
  { "EdenEast/nightfox.nvim", lazy = true, priority = 1000 },
  { "arcticicestudio/nord-vim", lazy = true, priority = 1000 },
  { "folke/tokyonight.nvim", lazy = true, priority = 1000 },
}
