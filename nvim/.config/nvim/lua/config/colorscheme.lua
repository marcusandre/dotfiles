local M = {}

---@alias background "light" | "dark"
---@param mode background
M.apply = function(mode)
  vim.opt.background = mode
  if mode == "light" then
    vim.cmd("colorscheme iceberg")
  else
    vim.cmd("colorscheme tokyonight")
  end
end

return M
