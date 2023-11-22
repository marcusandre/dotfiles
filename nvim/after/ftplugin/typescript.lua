local utils = require('m.utils')

vim.keymap.set(
  'n',
  '<leader>fS',
  "<Cmd>Pick lsp scope='workspace_symbol' symbol_query=vim.fn.input('Symbol: ')<CR>",
  { desc = 'Symbols (Workspace)' }
)

vim.keymap.set('n', '<leader>fF', utils.find_files_without_spec, { desc = 'foo' })
