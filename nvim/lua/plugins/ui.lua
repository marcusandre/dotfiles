return {
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "storm"
      })

      vim.cmd [[colorscheme tokyonight]]
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      char = '╎',
      show_trailing_blankline_indent = false,
    },
  },
}
