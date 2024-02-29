return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'work',
        path = '~/Documents/Sagittarius',
      },
    },
  },
}
