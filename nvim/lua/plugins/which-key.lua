return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    require('which-key').setup()

    require('which-key').register({
      ['<leader>b'] = { name = '[B]uffers', _ = 'which_key_ignore' },
      ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      ['<leader>l'] = { name = '[L]sp', _ = 'which_key_ignore' },
      ['<leader>o'] = { name = '[O]thers', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = '[T]esting', _ = 'which_key_ignore' },
    })
  end,
}
