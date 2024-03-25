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
    ui = {
      enable = false,
    },
    workspaces = {
      {
        name = 'work',
        path = '~/src/projects/github.com/marcusandre/obsidian',
      },
    },
  },
}
