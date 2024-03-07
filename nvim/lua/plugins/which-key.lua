return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    require('which-key').setup()

    require('which-key').register({
      ['<leader>b'] = { name = 'Buffers', _ = 'which_key_ignore' },
      ['<leader>f'] = { name = 'Find', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = 'Git', _ = 'which_key_ignore' },
      ['<leader>l'] = { name = 'Lsp', _ = 'which_key_ignore' },
      ['<leader>o'] = { name = 'Others', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = 'Testing', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = 'Window', _ = 'which_key_ignore' },
    })
  end,
}
