local function augroup(name) return vim.api.nvim_create_augroup("m_autocmds_" .. name, { clear = true }) end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function() vim.highlight.on_yank() end,
})

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Auto create dir recursively when saving a file
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then return end
    ---@diagnostic disable-next-line: undefined-field
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Jump to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then pcall(vim.api.nvim_win_set_cursor, 0, mark) end
  end,
})

-- Toggle `relativenumber` on insert enter/leave
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  group = augroup("enter_relativenumber"),
  command = "setlocal norelativenumber",
})

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  group = augroup("leave_relativenumber"),
  command = "setlocal relativenumber",
})

-- Display diagnostics as virtual text only if not in insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  group = augroup("insert_diagnostics"),
  callback = function()
    vim.diagnostic.config({
      virtual_text = false,
    })
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  group = augroup("leaver_diagnostics"),
  callback = function()
    vim.diagnostic.config({
      virtual_text = true,
    })
  end,
})
