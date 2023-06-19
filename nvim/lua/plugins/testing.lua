return {
  {
    'vim-test/vim-test',
    keys = {
      { '<leader>tf', '<Cmd>TestFile<CR>',    desc = 'Test: file' },
      { '<leader>tl', '<Cmd>TestLast<CR>',    desc = 'Test: last' },
      { '<leader>tn', '<Cmd>TestNearest<CR>', desc = 'Test: nearest' },
      { '<leader>ts', '<Cmd>TestSuite<CR>',   desc = 'Test: suite' },
      { '<leader>tv', '<Cmd>TestVisit<CR>',   desc = 'Test: visit' },
    },
    config = function()
      vim.g['test#strategy'] = 'neovim'
      vim.g['test#neovim#start_normal'] = '1'
      vim.g['test#neovim#term_position'] = 'vert'
    end,
  },
  {
    'andythigpen/nvim-coverage',
    keys = {
      { '<leader>tc', '<Cmd>Coverage<CR>', desc = 'Test: Coverage' },
    },
    config = function() require('coverage').setup() end,
    dependencies = { 'nvim-lua/plenary.nvim', },
  },
}
