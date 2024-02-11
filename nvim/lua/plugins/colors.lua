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
    --   vim.cmd([[colorscheme tokyonight-night]])
    -- end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('gruvbox').setup({
        contrast = 'hard',
        overrides = {},
      })
      -- vim.cmd([[colorscheme gruvbox]])
    end,
  },
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    -- config = function() vim.cmd([[colorscheme everforest]]) end,
  },
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    config = function() vim.cmd([[colorscheme nightfox]]) end,
  },
}
