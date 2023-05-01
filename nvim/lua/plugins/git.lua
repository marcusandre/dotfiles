return {
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        signs = {
          add = { text = '▒' },
          change = { text = '▒' },
          changedelete = { text = '▓' },
          delete = { text = '▓' },
          topdelete = { text = '▓' },
          untracked = { text = '░' },
        },
        preview_config = { border = 'double' },
        watch_gitdir = { interval = 1000 },
      })

      vim.keymap.set('n', '<leader>go', '<Cmd>Git<CR>', { desc = 'Git: Open (Fugitive)' })
      vim.keymap.set('n', '[h', '<Cmd>Gitsigns prev_hunk<CR>zvzz', { desc = 'Git: Previous Hunk' })
      vim.keymap.set('n', ']h', '<Cmd>Gitsigns next_hunk<CR>zvzz', { desc = 'Git: Next Hunk' })
    end,
  },
}
