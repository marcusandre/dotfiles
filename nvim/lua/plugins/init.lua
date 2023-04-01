return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Alternative files
  'tpope/vim-projectionist',

  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({})
    end
  },

  { 'arcticicestudio/nord-vim' },
  { 'folke/tokyonight.nvim' },
}
