-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('man-highlight-yank', { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'gitcommit', 'markdown' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Disable "`" autopair expansion for some filetypes
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'gitcommit', 'markdown' },
  callback = function(event) vim.keymap.set('i', '`', '`', { buffer = event.buf }) end,
})

-- Display diagnostics as virtual text only if not in insert mode
vim.api.nvim_create_autocmd('InsertEnter', {
  pattern = '*',
  callback = function()
    vim.diagnostic.config({
      virtual_text = false,
    })
  end,
})
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  callback = function()
    vim.diagnostic.config({
      virtual_text = true,
    })
  end,
})
