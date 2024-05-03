return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  event = 'VeryLazy',
  enabled = false,
  dependencies = { 'tpope/vim-sleuth' },
  opts = {
    indent = {
      char = '│',
    },
    scope = {
      enabled = false,
    },
  },
}
