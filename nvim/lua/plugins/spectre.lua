return {
  {
    'nvim-pack/nvim-spectre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { open_cmd = 'noswapfile vnew' },
    keys = {
      {
        '<leader>os',
        function() require('spectre').open() end,
        desc = 'Search and replace',
      },
    },
  },
}
