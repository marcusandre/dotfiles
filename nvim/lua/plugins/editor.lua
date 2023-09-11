return {
  'tpope/vim-projectionist',
  'tpope/vim-sleuth',
  {
    'mbbill/undotree',
    keys = {
      { '<leader>u', '<CMD>UndotreeToggle<CR>', desc = 'Open undotree' },
    },
  },
  {
    "ethanholz/nvim-lastplace",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = { "gitcommit", "gitrebase", "hgcommit" },
        lastplace_open_folds = true
      })
    end,
  },
}
