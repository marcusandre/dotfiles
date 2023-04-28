return {
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({})

      vim.keymap.set('n', '<leader>go', '<Cmd>Git<CR>', { desc = 'Git: Open (Fugitive)' })
      vim.keymap.set('n', '[h', '<Cmd>Gitsigns prev_hunk<CR>', { desc = 'Git: Previous Hunk' })
      vim.keymap.set('n', ']h', '<Cmd>Gitsigns next_hunk<CR>', { desc = 'Git: Next Hunk' })
    end,
  },
}
