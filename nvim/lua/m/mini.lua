local M = {}

local is_inside_work_tree = {}

M.project_files = function()
  local opts = {}
  local cwd = vim.fn.getcwd()
  local pickers = require("mini.extra").pickers
  local builtin = require("mini.pick").builtin

  if is_inside_work_tree[cwd] == nil then
    vim.fn.system("git rev-parse --is-inside-work-tree")
    is_inside_work_tree[cwd] = vim.v.shell_error == 0
  end

  if is_inside_work_tree[cwd] then
    pickers.git_files(opts)
  else
    builtin.files(opts)
  end
end

return M
