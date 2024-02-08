return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
      },
    },
    -- config = function(opts)
    --   require('tokyonight').setup(opts)
    --   vim.cmd([[colorscheme tokyonight]])
    -- end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('gruvbox').setup({ contrast = 'hard' })
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
}
