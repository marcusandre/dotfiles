return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true, opts = {} },
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'folke/neodev.nvim',
    },
    config = function()
      local mason_lspconfig = require('mason-lspconfig')

      require('neodev').setup()

      local on_attach = function(_, buf_id)
        vim.bo[buf_id].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'

        vim.api.nvim_buf_create_user_command(
          buf_id,
          'Format',
          function(_) vim.lsp.buf.format() end,
          { desc = 'Format current buffer with LSP' }
        )
      end

      local servers = {
        gopls = {},
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = { disable = { 'missing-fields' } },
          },
        },
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          require('lspconfig')[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
          })
        end,
      })
    end,
  },
}
