return {
  {
    "nordtheme/vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme nord')
    end,
  },
  {
    "atelierbram/vim-colors_atelier-schemes",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd('colorscheme nord')
    end,
  }
}
