local organize_imports = function()
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      only = { 'source.organizeImports.ts' },
      diagnostics = {},
    },
  })
end

local remove_unused = function()
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      only = { 'source.removeUnused.ts' },
      diagnostics = {},
    },
  })
end

vim.keymap.set('n', '<leader>vv', function()
  remove_unused()
  organize_imports()
end, { desc = 'Remove unused & organize Imports' })

vim.keymap.set('n', '<leader>vi', remove_unused, { desc = 'Organize Imports' })
vim.keymap.set('n', '<leader>vu', remove_unused, { desc = 'Remove Unused' })
