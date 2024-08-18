return {
  {
    "EdenEast/nightfox.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {},
    config = function() vim.cmd("colorscheme duskfox") end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function() vim.cmd("colorscheme tokyonight-storm") end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.o.background = "dark"
      require("gruvbox").setup({ contrast = "hard" })
      vim.cmd("colorscheme gruvbox")
    end,
  },
}
