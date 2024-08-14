return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function() vim.cmd("colorscheme duskfox") end,
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {},
    config = function() vim.cmd("colorscheme tokyonight-moon") end,
  },
}
