return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'williamboman/mason.nvim',
        config = true
      },
      'williamboman/mason-lspconfig.nvim',
      {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        opts = {}
      },
      'folke/neodev.nvim',
    },
    config = function()
      require("mason").setup()
      local mason_lspconfig = require("mason-lspconfig")

      local servers = {
        cssls = {},
        eslint = {},
        gopls = {},
        jsonls = {},
        lua_ls = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
            telemetry = { enable = false },
          },
        },
        marksman = {},
        rust_analyzer = {},
        -- stylelint_lsp = {},
        terraformls = {},
        tsserver = {},
        yamlls = {},
        zls = {},
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local lspconfig = require('lspconfig')

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
      keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { desc = 'Perform code action' })
      keymap.set('n', '<leader>k', vim.lsp.buf.hover, { desc = 'Show docs for item under cursor' })
      keymap.set('n', '<leader>r', vim.lsp.buf.rename, { desc = 'Rename symbol' })
      keymap.set('n', '<leader>K', vim.lsp.buf.signature_help, { desc = 'Show signature help' })
    end
  },
  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function()
      require('lsp_lines').setup()

      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = { only_current_line = true },
      })

      vim.keymap.set('', '<Leader>td', require('lsp_lines').toggle, { desc = 'Toggle LSP lines' })
    end,
  },
}
