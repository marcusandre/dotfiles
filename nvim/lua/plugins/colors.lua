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
    config = function(opts)
      require('tokyonight').setup(opts)
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('gruvbox').setup({
        contrast = 'hard',
        overrides = {
          -- MiniPickBorder = { bg = '#fafafa' },
          -- MiniPickBorderBusy = { bg = '#fafafa' },
          -- MiniPickBorderText = { bg = '#fafafa' },
          -- MiniPickIconDirectory = { bg = '#fafafa' },
          -- MiniPickIconFile = { bg = '#fafafa' },
          -- MiniPickHeader = { bg = '#fafafa' },
          MiniPickMatchCurrent = { bg = '#665c54' },
          -- MiniPickMatchMarked = { bg = '#fafafa' },
          -- MiniPickMatchRanges = { bg = '#fafafa' },
          -- MiniPickNormal = { bg = '#fafafa' },
          -- MiniPickPreviewLine = { bg = '#fafafa' },
          -- MiniPickPreviewRegion = { bg = '#fafafa' },
          -- MiniPickPrompt = { bg = '#fafafa' },
        },
      })
      -- vim.cmd([[colorscheme gruvbox]])
    end,
  },
}
