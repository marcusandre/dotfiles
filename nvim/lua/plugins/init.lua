return {
  -- Blessings from the Pope
  'tpope/vim-eunuch',
  'tpope/vim-projectionist',
  'tpope/vim-sleuth',
  'tpope/vim-surround',

  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({})
    end
  },

  -- Themes
  { 'EdenEast/nightfox.nvim' },
  { 'arcticicestudio/nord-vim' },
  { 'folke/tokyonight.nvim' },
}
