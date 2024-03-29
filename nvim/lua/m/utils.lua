local M = {}

--- Keymaps
M.map = function(mode, lhs, rhs, opts)
  if lhs == '' then return end
  opts = vim.tbl_deep_extend('force', { silent = true }, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end

--- Buffers
M.open_scratch_buffer = function()
  local buf_id = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_win_set_buf(0, buf_id)
  return buf_id
end

M.open_starter_if_empty_buffer = function()
  local buf_id = vim.api.nvim_get_current_buf()
  local is_empty = vim.api.nvim_buf_get_name(0) == '' and vim.bo.filetype == ''
  if not is_empty then return end

  local orig_cwd = os.getenv('PWD')
  if orig_cwd then vim.fn.chdir(orig_cwd) end
  vim.cmd('only')
  require('mini.starter').open()
  vim.api.nvim_buf_delete(buf_id, { force = true })
end

M.delete_buffer = function(...)
  require('mini.bufremove').delete(...)
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
  vim.cmd('only')
end

-- Telescope
M.find_changed_files = function(opts)
  local conf = require('telescope.config').values
  local finders = require('telescope.finders')
  local pickers = require('telescope.pickers')

  opts = opts or {}
  pickers
    .new(opts, {
      prompt_title = 'Git Diff (origin/main)',
      finder = finders.new_oneshot_job({
        'git',
        'diff',
        'origin/main',
        '--name-only',
      }, opts),
      sorter = conf.generic_sorter(),
    })
    :find()
end

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

-- Diffview
M.diffview_toggle = function()
  local lib = require('diffview.lib')
  local view = lib.get_current_view()
  if view then
    vim.cmd.DiffviewClose()
  else
    vim.cmd.DiffviewOpen()
  end
end

return M
