return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'c',
        'cpp',
        'go',
        'lua',
        'rust',
        'tsx',
        'typescript',
      },
      highlight = { enable = true },
      indent = { enable = true, disable = { 'python' } },
    }

    pcall(require('nvim-treesitter.install').update { with_sync = true })
  end,
}
