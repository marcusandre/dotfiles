return {
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    config = function() vim.cmd([[colorscheme carbonfox]]) end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    -- config = function() vim.cmd([[colorscheme tokyonight-night]]) end,
  },
  {
    'olivercederborg/poimandres.nvim',
    lazy = false,
    priority = 1000,
    -- config = function() vim.cmd([[colorscheme tokyonight-night]]) end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    -- config = function()
    --   require('gruvbox').setup({
    --     contrast = 'hard',
    --     overrides = {},
    --   })
    --   vim.cmd([[colorscheme gruvbox]])
    -- end,
  },
}
