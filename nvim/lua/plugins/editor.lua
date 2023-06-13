return {
  'tpope/vim-eunuch',
  'tpope/vim-projectionist',
  'tpope/vim-sleuth',
  {
    'mbbill/undotree',
    keys = {
      { '<leader>eu', '<CMD>UndotreeToggle<CR>', desc = 'Explore: Undo' },
    },
  },
  {
    "folke/which-key.nvim",
    config = function()
      require('which-key').setup()

      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    keys = {
      { '<leader>et', '<CMD>NvimTreeToggle<CR>', desc = 'Explore: Tree' },
    },
    config = function()
      require('nvim-tree').setup({
        sort_by = 'case_sensitive',
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      })
    end,
  },
}
