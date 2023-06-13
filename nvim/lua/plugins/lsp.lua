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
        cssls = {},
        eslint = {},
        jsonls = {},
        lua_ls = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
            runtime = { version = 'LuaJIT' },
            telemetry = { enable = false },
            workspace = { library = vim.api.nvim_get_runtime_file('', true) },
          },
        },
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
          })
        end, { desc = 'Format current buffer with LSP' })

        vim.api.nvim_buf_create_user_command(bufnr, 'FormatSync', function()
          vim.lsp.buf.format({
            async = false,
            bufnr = bufnr,
          })
        end, { desc = 'Format current buffer with LSP' })

        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format { async = false }
          end
        })

        vim.api.nvim_create_autocmd('BufWritePre', {
          pattern = { '*.tsx', '*.ts', '*.jsx', '*.js' },
          command = 'silent! EslintFixAll',
          group = vim.api.nvim_create_augroup('EslintFmt', {}),
        })
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

      vim.cmd([[cabbrev wq execute "FormatSync" <bar> wq]])
    end,
  },
  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function()
      require('lsp_lines').setup()

      vim.diagnostic.config({
        virtual_text = false,
      })

      vim.keymap.set('', '<Leader>dt', require('lsp_lines').toggle, { desc = 'Toggle lsp_lines' })
    end,
  },
}
