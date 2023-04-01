return {
  {
    'vim-test/vim-test',
    config = function()
      vim.g['test#strategy'] = 'neovim'

      vim.api.nvim_set_keymap('n', '<leader>tn', '<cmd>TestNearest<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>TestFile<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>ts', '<cmd>TestSuite<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>tl', '<cmd>TestLast<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>tv', '<cmd>TestVisit<CR>', { noremap = true, silent = true })
    end
  },
  {
    'andythigpen/nvim-coverage',
    config = function()
      require('coverage').setup()

      vim.api.nvim_set_keymap('n', '<leader>tc', '<cmd>Coverage<CR>', { noremap = true, silent = true })
    end,
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
  }
}
