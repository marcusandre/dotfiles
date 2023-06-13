return {
  {
    "nordtheme/vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme nord')
    end,
  }
}
