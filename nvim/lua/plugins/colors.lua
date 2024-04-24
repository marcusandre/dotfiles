return {
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    -- config = function() vim.cmd([[colorscheme nightfox]]) end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function() vim.cmd([[colorscheme tokyonight]]) end,
  },
  {
    'olivercederborg/poimandres.nvim',
    lazy = false,
    priority = 1000,
    -- config = function() vim.cmd([[colorscheme poimandres]]) end,
  },
  {
    'tomasr/molokai',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd([[colorscheme molokai]])
      --
      -- -- mini.statusline
      -- vim.api.nvim_set_hl(0, 'MiniStatuslineModeNormal', { bg = '#4C4745', fg = '#FFFFFF' })
      -- vim.api.nvim_set_hl(0, 'MiniStatuslineModeInsert', { bg = '#AE81FF', fg = '#FFFFFF' })
      -- vim.api.nvim_set_hl(0, 'MiniStatuslineFilename', { bg = '#4C4745', fg = '#89807D' })
      -- vim.api.nvim_set_hl(0, 'MiniStatuslineFileinfo', { bg = '#4C4745', fg = '#89807D' })
    end,
  },
}
