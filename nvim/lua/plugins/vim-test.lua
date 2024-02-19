return {
  {
    'vim-test/vim-test',
    keys = {
      -- stylua: ignore start
      { '<leader>tF', '<Cmd>TestFile --coverage --runInBand --ci<CR>', desc = 'Test: file (coverage)' },
      { '<leader>tL', '<Cmd>TestLast --coverage --runInBand --ci<CR>', desc = 'Test: last (coverage)' },
      { '<leader>tN', '<Cmd>TestNearest --coverage --runInBand --ci<CR>', desc = 'Test: nearest (coverage)' },
      { '<leader>tS', '<Cmd>TestSuite --coverage --runInBand --ci<CR>', desc = 'Test: suite (coverage)' },
      { '<leader>tf', '<Cmd>TestFile --runInBand --ci<CR>', desc = 'Test: file' },
      { '<leader>tl', '<Cmd>TestLast --runInBand --ci<CR>', desc = 'Test: last' },
      { '<leader>tn', '<Cmd>TestNearest --runInBand --ci<CR>', desc = 'Test: nearest' },
      { '<leader>ts', '<Cmd>TestSuite --runInBand --ci<CR>', desc = 'Test: suite' },
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
