return {
  {
    'ethanholz/nvim-lastplace',
    event = 'BufReadPre',
    config = function()
      require('nvim-lastplace').setup({
        lastplace_ignore_buftype = { 'quickfix', 'nofile', 'help' },
        lastplace_ignore_filetype = { 'gitcommit', 'gitrebase' },
      })
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    ft = { 'markdown' },
    build = function() vim.fn['mkdp#util#install']() end,
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    'jghauser/mkdir.nvim',
    event = 'BufWritePre',
  },
  {
    'm4xshen/hardtime.nvim',
    config = true,
  },
  {
    'ethanholz/freeze.nvim',
    keys = {
      { '<leader>of', '<Cmd>Freeze<CR>', desc = 'Freeze', mode = 'v' },
      { '<leader>of', '<Cmd>FreezeLine<CR>', desc = 'Freeze', mode = 'n' },
    },
    config = true,
  },
}
