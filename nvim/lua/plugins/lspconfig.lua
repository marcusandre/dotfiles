return {
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
      -- mason
      { 'williamboman/mason.nvim', config = true, opts = {} },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- lua
      'folke/neodev.nvim',

      -- cmp
      'hrsh7th/nvim-cmp',
    },
    keys = {
      -- stylua: ignore start
      -- { '<leader>la', vim.lsp.buf.code_action,                                           desc = 'Code Action' },
      -- { '<leader>lD', vim.lsp.buf.declaration,                                           desc = 'Declaration' },
      -- { '<leader>ld', vim.lsp.buf.definition,                                            desc = 'Definition' },
      -- { '<leader>li', vim.lsp.buf.implementation,                                        desc = 'Implementation' },
      -- { '<leader>lR', vim.lsp.buf.references,                                            desc = 'References' },
      -- { '<leader>lv', '<cmd>vsplit | lua vim.lsp.buf.definition()<CR>',                  desc = 'Definition (split)' },
      -- { '<leader>ly', vim.lsp.buf.type_definition,                                       desc = 'Type Definition' },
      { '<leader>lf', '<Cmd>lua require("conform").format({ lsp_fallback = true })<CR>', desc = 'Format' },
      { '<leader>lF', '<Cmd>lua vim.lsp.buf.format({ async = true })<CR>',               desc = 'Format (legacy)' },
      { '<leader>lk', vim.lsp.buf.signature_help,                                        desc = 'Signature Documentation' },
      { '<leader>lo', vim.diagnostic.open_float,                                         desc = 'Open float' },
      { '<leader>lr', vim.lsp.buf.rename,                                                desc = 'Rename' },
      { '<leader>lR', '<Cmd>LspRestart<CR>',                                             desc = 'Rename' },
      { '<leader>lq', vim.diagnostic.setqflist,                                          desc = 'Quickfix' },
      { 'K',          vim.lsp.buf.hover,                                                 desc = 'Documentation' },
      -- stylua: ignore end
    },
    config = function()
      local mason_lspconfig = require('mason-lspconfig')
      local mason_tool_installer = require('mason-tool-installer')

      require('neodev').setup()

      local on_attach = function(client)
        if client.name == 'tsserver' then
          -- client.server_capabilities.semanticTokensProvider = nil
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end

        if client.name == 'gopls' then
          if not client.server_capabilities.semanticTokensProvider then
            local semantic = client.config.capabilities.textDocument.semanticTokens
            client.server_capabilities.semanticTokensProvider = {
              full = true,
              legend = {
                tokenTypes = semantic.tokenTypes,
                tokenModifiers = semantic.tokenModifiers,
              },
              range = true,
            }
          end
        end

        -- vim.bo[buf_id].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
      end

      local servers = {
        gopls = {
          usePlaceholders = true,
          gofumpt = true,
          analyses = {
            fieldalignment = true,
            nilness = true,
            unusedparams = true,
            unusedwrite = true,
            useany = true,
          },
          codelenses = {
            gc_details = false,
            generate = true,
            regenerate_cgo = true,
            run_govulncheck = true,
            test = true,
            tidy = true,
            upgrade_dependency = true,
            vendor = true,
          },
          experimentalPostfixCompletions = true,
          completeUnimported = true,
          staticcheck = true,
          directoryFilters = { '-.git', '-node_modules' },
          semanticTokens = true,
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
        },
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = { disable = { 'missing-fields' } },
          },
        },
        rust_analyzer = {
          ['rust-analyzer'] = {
            cargo = {
              allFeatures = true,
            },
            inlayHints = {
              chainingHints = { enable = false },
            },
          },
        },
        tsserver = {
          filetypes = {
            'javascript',
            'javascriptreact',
            'javascript.jsx',
            'typescript',
            'typescriptreact',
            'typescript.tsx',
          },
          completions = {
            completeFunctionCalls = true,
          },
        },
        terraformls = {},
        eslint = {},
        dockerls = {},
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'actionlint',
        'commitlint',
        'eslint_d',
        'gofumpt',
        'goimports',
        'prettier',
        'stylua',
      })
      mason_tool_installer.setup({ ensure_installed = ensure_installed })

      mason_lspconfig.setup({
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({
              capabilities = capabilities,
              on_attach = on_attach,
              settings = servers[server_name],
              filetypes = (servers[server_name] or {}).filetypes,
            })
          end,
        },
      })
    end,
  },
  {
    'j-hui/fidget.nvim',
    opts = {},
  },
}
