return {
  {
    'vim-test/vim-test',
    keys = {
      -- stylua: ignore start
      { '<leader>tF', '<Cmd>TestFile --coverage<CR>', desc = 'Test: file (coverage)' },
      { '<leader>tL', '<Cmd>TestLast --coverage<CR>', desc = 'Test: last (coverage)' },
      { '<leader>tN', '<Cmd>TestNearest --coverage<CR>', desc = 'Test: nearest (coverage)' },
      { '<leader>tS', '<Cmd>TestSuite --coverage<CR>', desc = 'Test: suite (coverage)' },
      { '<leader>tf', '<Cmd>TestFile<CR>', desc = 'Test: file' },
      { '<leader>tl', '<Cmd>TestLast<CR>', desc = 'Test: last' },
      { '<leader>tn', '<Cmd>TestNearest<CR>', desc = 'Test: nearest' },
      { '<leader>ts', '<Cmd>TestSuite<CR>', desc = 'Test: suite' },
      { '<leader>tv', '<Cmd>TestVisit<CR>', desc = 'Test: visit' },
      { '<leader>tc', '<Cmd>Coverage<CR>', desc = 'Test: coverage' },
      -- stylua: ignore end
    },
    config = function()
      vim.g['test#strategy'] = 'neovim'
      vim.g['test#neovim#start_normal'] = '1'
      vim.g['test#neovim#term_position'] = 'vert'
    end,
  },
  {
    'andythigpen/nvim-coverage',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() require('coverage').setup() end,
  },
  { 'tpope/vim-projectionist' },
}
