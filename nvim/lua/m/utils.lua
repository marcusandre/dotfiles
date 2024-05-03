local M = {}

local is_inside_work_tree = {}

--- Keymaps
M.map = function(mode, lhs, rhs, opts)
  if lhs == '' then return end
  opts = vim.tbl_deep_extend('force', { silent = true }, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end

M.toggle_inlay_hints = function() vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled()) end

--- LSP
M.enable_inlay_hints = function(client, bufnr)
  if client.supports_method('textDocument/inlayHint') then
    local inlay_hints_group = vim.api.nvim_create_augroup('man-toggle_inlay_hints', { clear = false })

    vim.defer_fn(function()
      local mode = vim.api.nvim_get_mode().mode
      vim.lsp.inlay_hint.enable(bufnr, mode == 'n' or mode == 'v')
    end, 500)

    vim.api.nvim_create_autocmd('InsertEnter', {
      group = inlay_hints_group,
      desc = 'Enable inlay hints',
      buffer = bufnr,
      callback = function() vim.lsp.inlay_hint.enable(bufnr, false) end,
    })

    vim.api.nvim_create_autocmd('InsertLeave', {
      group = inlay_hints_group,
      desc = 'Disable inlay hints',
      buffer = bufnr,
      callback = function() vim.lsp.inlay_hint.enable(bufnr, true) end,
    })
  end
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
  local pickers = require('telescope.pickers')
  local finders = require('telescope.finders')
  local sorters = require('telescope.sorters')

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
      sorter = sorters.get_generic_fuzzy_sorter(),
    })
    :find()
end

M.git_co_authors = function(opts)
  local make_entry = require('telescope.make_entry')
  local pickers = require('telescope.pickers')
  local finders = require('telescope.finders')
  local sorters = require('telescope.sorters')
  local actions = require('telescope.actions')
  local action_state = require('telescope.actions.state')
  local command = { 'git', 'log', '--pretty=%aN <%aE>' }

  local seen = {}
  local string_entry_maker = make_entry.gen_from_string()
  opts = opts or {}
  opts.entry_maker = function(string)
    if not seen[string] then
      seen[string] = true
      return string_entry_maker(string)
    else
      return nil
    end
  end

  opts = opts or {}
  pickers
    .new(opts, {
      prompt_title = 'Git Co-Authors',
      finder = finders.new_oneshot_job(command, opts),
      sorter = sorters.get_generic_fuzzy_sorter(),
      attach_mappings = function(bufnr, map)
        local insert = function()
          local picker = action_state.get_current_picker(bufnr)
          local selections = picker:get_multi_selection()
          if next(selections) == nil then selections = { picker:get_selection() } end
          actions.close(bufnr)

          local coauthors = { '', '' }
          for _, c in ipairs(selections) do
            table.insert(coauthors, 'Co-authored-by: ' .. c[1])
          end
          vim.api.nvim_put(coauthors, 'l', true, false)
        end

        map('i', '<CR>', insert)
        map('n', '<CR>', insert)

        return true
      end,
    })
    :find()
end

M.project_files = function(...)
  local builtin = require('telescope.builtin')

  local cwd = vim.fn.getcwd()
  if is_inside_work_tree[cwd] == nil then
    vim.fn.system('git rev-parse --is-inside-work-tree')
    is_inside_work_tree[cwd] = vim.v.shell_error == 0
  end

  if is_inside_work_tree[cwd] then
    builtin.git_files(...)
  else
    builtin.find_files(...)
  end
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
