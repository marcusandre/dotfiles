return {
  'tpope/vim-fugitive',
  lazy = false,
  keys = {
    { '<leader>gg', '<Cmd>Git<CR>', desc = 'Fugitive' },
    { '<leader>gG', '<Cmd>tab Git<CR>', desc = 'Fugitive (full)' },
  },
}
