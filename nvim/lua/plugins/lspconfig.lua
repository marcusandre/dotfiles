return { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- Lua
    { 'folke/neodev.nvim', opts = {} },

    -- Depend on Telescope for keybindings
    'nvim-telescope/telescope.nvim',

    -- Useful status updates for LSP.
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    local builtin = require('telescope.builtin')

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('man-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc) vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc }) end

        map('<leader>lS', builtin.lsp_dynamic_workspace_symbols, 'Workspace Symbols')
        map('<leader>ld', builtin.diagnostics, 'Diagnostics')
        map('<leader>le', vim.diagnostic.open_float, 'Error Message')
        map('<leader>li', builtin.lsp_implementations, 'Implementation')
        map('<leader>lk', vim.lsp.buf.signature_help, 'Signature Documentation')
        map('<leader>lq', vim.diagnostic.setloclist, 'Populate Quickfix')
        map('<leader>lr', vim.lsp.buf.rename, 'Rename')
        map('<leader>ls', builtin.lsp_document_symbols, 'Document Symbols')
        map('<leader>lt', builtin.lsp_type_definitions, 'Type Definition')
        map('<leader>lv', function() builtin.lsp_definitions({ jump_type = 'vsplit' }) end, 'Definition (vsplit)')
        map('K', vim.lsp.buf.hover, 'Hover Documentation')
        map('gD', vim.lsp.buf.declaration, 'Declaration')
        map('gd', builtin.lsp_definitions, 'Definition')
        map('gr', builtin.lsp_references, 'References')

        map(
          '<leader>la',
          function() vim.lsp.buf.code_action({ context = { only = { 'quickfix', 'refactor', 'source' } } }) end,
          'Code Action'
        )
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {
      -- clangd = {},

      gopls = {
        settings = {
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
        },
        on_attach = function(client)
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
        end,
      },

      rust_analyzer = {
        settings = {
          ['rust-analyzer'] = {
            cargo = {
              allFeatures = true,
            },
            inlayHints = {
              chainingHints = { enable = false },
            },
          },
        },
      },

      -- tsserver = {
      --   filetypes = {
      --     'javascript',
      --     'javascriptreact',
      --     'javascript.jsx',
      --     'typescript',
      --     'typescriptreact',
      --     'typescript.tsx',
      --   },
      --   settings = {
      --     typescript = {
      --       inlayHints = {
      --         includeInlayEnumMemberValueHints = true,
      --         includeInlayFunctionLikeReturnTypeHints = true,
      --         includeInlayFunctionParameterTypeHints = false,
      --         includeInlayParameterNameHints = 'all', -- 'none' | 'literals' | 'all';
      --         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      --         includeInlayPropertyDeclarationTypeHints = false,
      --         includeInlayVariableTypeHints = true,
      --       },
      --     },
      --     completions = {
      --       completeFunctionCalls = true,
      --     },
      --     experimental = {
      --       enableProjectDiagnostics = true,
      --     },
      --   },
      --   on_attach = function(client)
      --     -- client.server_capabilities.semanticTokensProvider = nil
      --     client.server_capabilities.documentFormattingProvider = false
      --     client.server_capabilities.documentRangeFormattingProvider = false
      --   end,
      -- },

      lua_ls = {
        -- cmd = {...},
        -- filetypes { ...},
        -- capabilities = {},
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
              checkThirdParty = false,
              library = {
                '${3rd}/luv/library',
                unpack(vim.api.nvim_get_runtime_file('', true)),
              },
            },
            diagnostics = {
              disable = { 'missing-fields' },
            },
          },
        },
      },

      eslint = {
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            command = 'EslintFixAll',
          })
        end,
      },

      zls = {},
      terraformls = {},
      dockerls = {},
      marksman = {},
      -- ocamllsp = {},
    }

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'actionlint',
      'gofumpt',
      'goimports',
      'hadolint',
      'prettier',
      'shfmt',
      'stylua',
      'tflint',
    })

    local on_attach = function(client, bufnr)
      -- if client.supports_method('textDocument/documentHighlight') then
      --   vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      --     buffer = bufnr,
      --     callback = vim.lsp.buf.document_highlight,
      --   })
      -- end
      --
      -- if client.supports_method('textDocument/clearReferences') then
      --   if vim.lsp.buf.clear_references then
      --     vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      --       buffer = bufnr,
      --       callback = vim.lsp.buf.clear_references,
      --     })
      --   end
      -- end

      if client.supports_method('textDocument/inlayHint') then
        local inlay_hints_group = vim.api.nvim_create_augroup('man-toggle_inlay_hints', { clear = false })

        vim.defer_fn(function()
          local mode = vim.api.nvim_get_mode().mode
          vim.lsp.inlay_hint.enable(bufnr, mode == 'n' or mode == 'v')
        end, 500)

        vim.api.nvim_create_autocmd('InsertEnter', {
          group = inlay_hints_group,
          desc = 'Enable inlay hints',
          buffer = bufnr,
          callback = function() vim.lsp.inlay_hint.enable(bufnr, false) end,
        })

        vim.api.nvim_create_autocmd('InsertLeave', {
          group = inlay_hints_group,
          desc = 'Disable inlay hints',
          buffer = bufnr,
          callback = function() vim.lsp.inlay_hint.enable(bufnr, true) end,
        })
      end
    end

    require('mason').setup()
    require('mason-tool-installer').setup({ ensure_installed = ensure_installed })
    require('mason-lspconfig').setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          require('lspconfig')[server_name].setup({
            cmd = server.cmd,
            settings = server.settings,
            filetypes = server.filetypes,
            capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {}),
            on_attach = function(...)
              on_attach(...)
              if server.on_attach then server.on_attach(...) end
            end,
          })
        end,
      },
    })
  end,
}
