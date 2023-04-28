return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'folke/neodev.nvim',
      'j-hui/fidget.nvim',
    },
    config = function()
      require('mason').setup({})
      require('fidget').setup({})

      local servers = {
        bashls = {},
        cssls = {},
        eslint = {},
        html = {},
        jsonls = {},
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = { globals = { 'vim' } },
          },
        },
        -- rome = {},
        rust_analyzer = {},
        stylelint_lsp = {},
        terraformls = {},
        tsserver = {},
        yamlls = {},
      }

      local mason_lspconfig = require('mason-lspconfig')
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      local on_attach = function(client, bufnr)
        local function buf_set_option(name, value) vim.api.nvim_buf_set_option(bufnr, name, value) end

        buf_set_option('omnifunc', 'v:lua.MiniCompletion.completefunc_lsp')

        if client.name == 'tsserver' then client.server_capabilities.documentFormattingProvider = false end

        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function()
          vim.lsp.buf.format({
            async = true,
            bufnr = bufnr,
            filter = function(fmtclient) return fmtclient.name == 'null-ls' end,
          })
        end, { desc = 'Format current buffer with LSP' })

        -- vim.api.nvim_create_autocmd('BufWritePre', {
        --   pattern = { '*.tsx', '*.ts', '*.jsx', '*.js' },
        --   command = 'silent! EslintFixAll',
        --   group = vim.api.nvim_create_augroup('EslintFmt', {}),
        -- })
      end

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          require('lspconfig')[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
          })
        end,
      })

      local keymap = vim.keymap

      -- Keymaps
      keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
      keymap.set('n', '<leader>le', vim.diagnostic.open_float, { desc = 'LSP: diagnostics popup' })
      keymap.set('n', '<leader>lf', '<Cmd>Format<CR>', { desc = 'LSP: format' })
      keymap.set('n', '<space>la', vim.lsp.buf.code_action, { desc = 'LSP: code action' })
      keymap.set('n', '<space>lr', vim.lsp.buf.rename, { desc = 'LSP: rename' })
      keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP: hover' })
    end,
  },
}
