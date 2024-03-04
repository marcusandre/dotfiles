return {
  {
    'pmizio/typescript-tools.nvim',
    event = {
      'BufReadPre *.ts,*.tsx,*.js,*.jsx',
      'BufNewFile *.ts,*.tsx,*.js,*.jsx',
    },
    keys = {
      { '<leader>va', '<Cmd>TSToolsAddMissingImports<CR>', desc = 'Add Missing Imports' },
      { '<leader>vf', '<Cmd>TSToolsFileReferences<CR>', desc = 'File References' },
      { '<leader>vo', '<Cmd>TSToolsOrganizeImports<CR>', desc = 'Organize Imports' },
      { '<leader>vr', '<Cmd>TSToolsRenameFile<CR>', desc = 'Rename File' },
      { '<leader>vu', '<Cmd>TSToolsRemoveUnused<CR>', desc = 'Remove Unused' },
      { '<leader>vv', '<Cmd>TSToolsFixAll<CR>', desc = 'Fix All' },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-lspconfig',
    },
    opts = {
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
      settings = {
        expose_as_code_action = 'all',
        jsx_close_tag = {
          enable = true,
          filetypes = {
            'javascriptreact',
            'typescriptreact',
          },
        },
        tsserver_file_preferences = {
          includeInlayParameterNameHints = 'all',
          includeInlayVariableTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
        },
      },
    },
  },
  {
    'dmmulroy/tsc.nvim',
    opts = {
      auto_open_qflist = true,
    },
  },
  {
    'dmmulroy/ts-error-translator.nvim',
    opts = {
      auto_override_publish_diagnostics = true,
    },
  },
}
