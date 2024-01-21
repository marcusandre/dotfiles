return {
  {
    'kdheepak/lazygit.nvim',
    keys = {
      { '<leader>gg', '<Cmd>LazyGit<CR>', desc = 'LazyGit' },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function() vim.g.lazygit_floating_window_scaling_factor = 1 end,
  },
}
