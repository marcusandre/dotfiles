local M = {}

local is_inside_work_tree = {}

--- Quickfix
M.toggle_quickfix = function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win['quickfix'] == 1 then qf_exists = true end
  end
  if qf_exists == true then
    vim.cmd('cclose')
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then vim.cmd('copen') end
end

--- Mini.Pick
M.pick_modified_untracked = function()
  local MiniPick = require('mini.pick')
  local local_opts = { command = { 'git', 'ls-files', '--modified', '--others', '--exclude-standard' } }
  local source = {
    name = 'Git files (modified + untracked)',
    show = function(buf_id, items, query) return MiniPick.default_show(buf_id, items, query, { show_icons = true }) end,
  }
  return MiniPick.builtin.cli(local_opts, { source = source })
end

M.pick_file_changes_from_branch = function()
  local cwd = vim.fn.getcwd()
  local MiniPick = require('mini.pick')

  if is_inside_work_tree[cwd] == nil then
    vim.fn.system('git rev-parse --is-inside-work-tree')
    is_inside_work_tree[cwd] = vim.v.shell_error == 0
  end

  if is_inside_work_tree[cwd] then
    local main_branch = vim.fn.trim(vim.fn.system("sed -e 's/^.*\\///' < .git/refs/remotes/origin/HEAD"))
    local local_opts = {
      command = { 'git', 'diff', 'origin/' .. main_branch, '--name-only' },
    }
    local source = {
      name = 'Git changes (branch)',
      show = function(buf_id, items, query) return MiniPick.default_show(buf_id, items, query, { show_icons = true }) end,
    }

    MiniPick.builtin.cli(local_opts, { source = source })
  end
end

--- Telescope
M.project_files = function()
  local opts = {}
  local builtin = require('telescope.builtin')

  local cwd = vim.fn.getcwd()
  if is_inside_work_tree[cwd] == nil then
    vim.fn.system('git rev-parse --is-inside-work-tree')
    is_inside_work_tree[cwd] = vim.v.shell_error == 0
  end

  if is_inside_work_tree[cwd] then
    builtin.git_files(opts)
  else
    builtin.find_files(opts)
  end
end

return M
