return {
  {
    'vim-test/vim-test',
    keys = {
      { '<leader>tF', '<Cmd>TestFile -strategy=make | copen<CR>', desc = 'Test: file (quickfix)' },
      { '<leader>tf', '<Cmd>TestFile<CR>',                        desc = 'Test: file' },
      { '<leader>tL', '<Cmd>TestLast -strategy=make | copen<CR>', desc = 'Test: last (quickfix)' },
      { '<leader>tl', '<Cmd>TestLast<CR>',                        desc = 'Test: last' },
      {
        '<leader>tN',
        '<Cmd>TestNearest -strategy=make | copen<CR>',
        desc = 'Test: nearest (quickfix)',
      },
      { '<leader>tn', '<Cmd>TestNearest<CR>',                      desc = 'Test: nearest' },
      { '<leader>tS', '<Cmd>TestSuite -strategy=make | copen<CR>', desc = 'Test: suite (quickfix)' },
      { '<leader>ts', '<Cmd>TestSuite<CR>',                        desc = 'Test: suite' },
      { '<leader>tv', '<Cmd>TestVisit<CR>',                        desc = 'Test: visit' },
      {
        '<leader>tc',
        '<Cmd>TermExec cmd="npx jest --coverage --silent -- % | grep %"<CR>',
        desc = 'Test: Coverage',
      },
    },
  },
  {
    'andythigpen/nvim-coverage',
    keys = {
      { '<leader>tC', '<Cmd>Coverage<CR>', desc = 'Test: Coverage' },
    },
    config = function() require('coverage').setup() end,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
}
