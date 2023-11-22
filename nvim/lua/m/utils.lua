local M = {}

-- Mini
M.pick_modified_untracked = function()
  local MiniPick = require('mini.pick')
  local local_opts = { command = { 'git', 'ls-files', '--modified', '--others', '--exclude-standard' } }
  local source = {
    name = 'Git files (modified + untracked)',
    show = function(buf_id, items, query) return MiniPick.default_show(buf_id, items, query, { show_icons = true }) end,
  }
  return MiniPick.builtin.cli(local_opts, { source = source })
end

local is_inside_work_tree = {}

M.pick_project_files = function()
  local opts = {}
  local cwd = vim.fn.getcwd()
  local MiniExtra = require('mini.extra')
  local MiniPick = require('mini.pick')

  if is_inside_work_tree[cwd] == nil then
    vim.fn.system('git rev-parse --is-inside-work-tree')
    is_inside_work_tree[cwd] = vim.v.shell_error == 0
  end

  if is_inside_work_tree[cwd] then
    MiniExtra.pickers.git_files(opts)
  else
    MiniPick.builtin.files(opts)
  end
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
      command = { 'git', 'diff', main_branch, '--name-only' },
    }
    local source = {
      name = 'Git changes (branch)',
      show = function(buf_id, items, query) return MiniPick.default_show(buf_id, items, query, { show_icons = true }) end,
    }

    MiniPick.builtin.cli(local_opts, { source = source })
  end
end

M.find_files_without_spec = function()
  local MiniPick = require('mini.pick')

  MiniPick.builtin.cli({
    command = { 'fd', '--type=f', '--no-follow', '--color=never', '-E=*.spec.js*', '-E=*.spec.ts*' },
  })
end

M.minifiles_toggle = function(...)
  local MiniFiles = require('mini.files')
  if not MiniFiles.close() then MiniFiles.open(...) end
end

M.minifiles_set_cwd = function()
  local MiniFiles = require('mini.files')
  local cur_entry_path = MiniFiles.get_fs_entry().path
  local cur_directory = vim.fs.dirname(cur_entry_path)

  vim.fn.chdir(cur_directory)
end

M.yank_reative_path = function()
  local MiniFiles = require('mini.files')
  local path_entry = MiniFiles.get_fs_entry().path
  local path = vim.fn.fnamemodify(path_entry, ':.')

  vim.fn.setreg('+', path)
  print(path)
end

-- Quickfix
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

-- Buffers
M.make_scratch_buffer = function()
  local buf_id = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_win_set_buf(0, buf_id)
  return buf_id
end

M.open_starter_if_empty_buffer = function()
  local buf_id = vim.api.nvim_get_current_buf()
  local is_empty = vim.api.nvim_buf_get_name(0) == '' and vim.bo.filetype == ''
  if not is_empty then return end

  local orig_cwd = os.getenv('PWD')
  vim.fn.chdir(orig_cwd)
  vim.cmd('only')
  require('mini.starter').open()
  vim.api.nvim_buf_delete(buf_id, { force = true })
end

M.delete_buffer = function(...)
  require('mini.bufremove').delete(...)
  M.open_starter_if_empty_buffer()
end

M.wipeout_buffer = function(...)
  require('mini.bufremove').wipeout(...)
  M.open_starter_if_empty_buffer()
end

M.delete_all_buffers = function()
  local buf_ids = vim.api.nvim_list_bufs()

  for _, buf_id in ipairs(buf_ids) do
    M.delete_buffer(buf_id)
  end
end

M.delete_other_buffers = function()
  local current_buf_id = vim.api.nvim_get_current_buf()
  local buf_ids = vim.api.nvim_list_bufs()

  for _, buf_id in ipairs(buf_ids) do
    if buf_id ~= current_buf_id then M.delete_buffer(buf_id) end
  end
end

-- LSP
M.file_on_rename = function(from, to)
  local ok, clients = pcall(vim.lsp.get_active_clients)
  if not ok or type(clients) ~= 'table' then return end

  for _, client in ipairs(clients) do
    local resp = client.request_sync('workspace/willRenameFiles', {
      files = {
        {
          oldUri = vim.uri_from_fname(from),
          newUri = vim.uri_from_fname(to),
        },
      },
    }, 1000, 0)
    if resp and resp.result ~= nil then vim.lsp.util.apply_workspace_edit(resp.result, client.offset_encoding) end
  end
end

return M
