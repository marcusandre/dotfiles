return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'VeryLazy',
    dependencies = 'tpope/vim-sleuth',
    opts = {
      indent = {
        char = '│',
        tab_char = '│',
      },
      scope = {
        enabled = false,
      },
      exclude = {
        filetypes = {
          'help',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
        },
      },
    },
  },
}
