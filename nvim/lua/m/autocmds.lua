-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('m-highlight-yank', { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})
