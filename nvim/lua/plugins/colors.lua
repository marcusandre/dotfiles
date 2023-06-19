local function change_background()
  local m = vim.fn.system("defaults read -g AppleInterfaceStyle")
  m = m:gsub("%s+", "") -- trim whitespace
  if m == "Dark" then
    vim.o.background = "dark"
  else
    vim.o.background = "light"
  end
end

return {
  {
    "nordtheme/vim",
    lazy = false,
    priority = 1000,
    config = function()
    end,
    -- vim.cmd('colorscheme nord')
  },
  {
    "cocopon/iceberg.vim",
    lazy = false,
    priority = 1000,
    config = function()
      change_background()
      vim.cmd('colorscheme iceberg')
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
